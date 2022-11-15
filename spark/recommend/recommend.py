import findspark
from pyspark.mllib.recommendation import ALS
from pyspark.sql import SparkSession
from redis import Redis

# 连接redis
redis = Redis(host="127.0.0.1")

# 获取redis中所有的key
keys = redis.keys()

# 组装数据：[{user: xxx, product: xxx, rating: xxx}, {}, ...]
data = []
for i in keys:
    key = i.decode()
    # 判断键是否是以 uid 开头
    if key.startswith("uid"):
        fields = redis.hkeys(i)
        for j in fields:
            # 读取值
            field_str = j.decode()
            field_value = redis.hget(i, j).decode()
            data.append({
                "user": key[4:],
                "product": field_str,
                "rating": field_value,
            })

# 初始化Spark Session
findspark.init()

# 创建spark会话
spark = SparkSession.builder.getOrCreate()

# 创建视图并进行查询
spark.createDataFrame(data).createOrReplaceTempView("df")
df = spark.sql("select user, product, rating from df")

# 训练模型
rank = 10
num_iterations = 10
model = ALS.train(df.rdd, rank, num_iterations)

# 为用户推荐产品
result = model.recommendProductsForUsers(50).collect()

# 定义lua脚本
script = """
redis.call('DEL', KEYS[1])
redis.call('SADD', KEYS[1], unpack(ARGV))
"""
lua = redis.register_script(script)

# 组装数据
for i in result:
    uid = i[0]
    ratings = i[1]
    # 推荐的商品的集合
    recommends = set()
    for j in ratings:
        if j.rating > 0:
            recommends.add(j.product)
    lua(keys=[f'recommend:{uid}'], args=list(recommends))

redis.close()
spark.stop()
