// 导入数据库操作模块
const db = require('../db/index')

// 用这个包来生成 Token 字符串
const jwt = require('jsonwebtoken')

const qs = require('qs')
// const redis = require('ioredis')


// 商品分类模块的处理函数
exports.shoplist = (req, res) => {

  const sql = `
  SELECT * FROM my_db_01.cl_shoplist_reco;
  SELECT * FROM my_db_01.cl_shoplist_greentea;
  SELECT * FROM my_db_01.cl_shoplist_oolong;
  SELECT * FROM my_db_01.cl_shoplist_redtea;
  SELECT * FROM my_db_01.cl_shoplist_plaintea;
  SELECT * FROM my_db_01.cl_shoplist_newshop;
  `
  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)

    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '获取分类数据成功！',

      data: [
        {
          // 推荐的一级
          id: 0,
          name: '推荐',
          data: [
            {
              // 二级
              id: 1,
              name: '推荐',
              list: results[0]
            }
          ]
        },
        {
          // 绿茶一级
          id: 1,
          name: '绿茶',
          data: [
            {
              //二级
              id: 1,
              name: '绿茶',
              list: results[1]
            }
          ]
        },
        {
          //一级
          id: 2,
          name: '乌龙',
          data: [
            {
              //二级
              id: 0,
              name: '乌龙',
              list: results[2]
            }
          ]
        },
        {
          //一级
          id: 3,
          name: '红茶',
          data: [
            {
              //二级
              id: 0,
              name: '红茶',
              list: results[3]
            }
          ]
        },
        {
          //一级
          id: 4,
          name: '白茶',
          data: [
            {
              //二级
              id: 0,
              name: '白茶',
              list: results[4]
            }
          ]
        },
        {
          // 新茶一级
          id: 5,
          name: '新茶',
          data: [
            {
              // 二级
              id: 0,
              name: '新茶',
              list: results[5]
            }
          ]
        },
      ]
    })
  })
}

// redis处理模块
exports.propelling = (req, res) => {
  //token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  // console.log(tokenObj);
  let goodsId = req.body.id
  // console.log(goodsId);
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    // console.log(uId);
    // console.log(goodsId);
    // 导入redis
    const redis = require('redis')
    const client = redis.createClient() //创建客户端
    // 监听错误信息
    client.on('err', err => {
      console.log('redis client error:', err);
    })
    client.connect(6379, '127.0.0.1').then(
      () => {
        // 查询redis库中的数据
        client.hGet(`uid:${uId}`, `${goodsId}`).then(val => {
          // 判断是否有数据
          if (val != null) {
            // 执行+1操作
            client.HINCRBY(`uid:${uId}`, `${goodsId}`, 1)
            console.log('执行hincrby操作');
          }
          else {
            // 如果没有数据则执行添加操作
            client.hSet(`uid:${uId}`, `${goodsId}`, 1);
            // console.log('执行set操作');
          }
        })
      })
    res.send({
      status: 200
    })

  })
}

// 后台可视化处理函数
exports.echartslist = (req, res) => {
  db.query(`select typeof, sum(numbe) sumbe from my_db_01.cl_useraction group by typeof`, function (error, results) {
    if (error) return res.cc(err)
    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '获取查询结果成功！',
      data: results,
    })
  })
}

// 用户信息处理函数
exports.myinfo = (req, res) => {
  //token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    if (error) return res.cc(err)
    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '获取查询结果成功！',
      data: results,
    })
  })
}

// 修改用户信息的处理函数
exports.saveinfo = (req, res) => {
  let name = req.body.name
  let img = req.body.img
  console.log(img);
  let tel = req.body.tel
  let id = req.body.uid
  console.log(id);
  console.log(name);
  db.query(`update my_db_01.ev_users set nickName='${name}', tel='${tel}',imgUrl='${img}' where id=${id}`, function (error, results) {
    if (error) return res.cc(error)
    res.send({
      status: 200,
      msg: '修改用户信息成功'
    })
  })
}

// 提交用户留言
exports.submitinfo = (req, res) => {
  let tel = req.body.tel
  let email = req.body.email
  let propse = req.body.propose

  // 接收token值
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, result) {
    //用户姓名
    let name = result[0].nickName;
    db.query(`insert into my_db_01.cl_peopse (tel,email,propse,name) values ('${tel}','${email}','${propse}','${name}')`, function (error, results) {
      if (error) return res.cc(error)
      res.send({
        status: 200,
        msg: '修改用户信息成功'
      })
    })
  })

}

// 获取用户留言信息
exports.getUserNews = (req, res) => {
  db.query(`SELECT * FROM my_db_01.cl_peopse`, function (error, results) {
    // 1. 执行 SQL 语句失败
    if (error) return res.cc(error)
    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '获取数据成功！',
      list:
      {
        list: results,
      },
      pageTotal: 4
    })
  })
}

// 删除用户留言信息
exports.deleteeUserNews = (req, res) => {
  let id = req.body.indexid;
  const sql = `DELETE FROM my_db_01.cl_peopse WHERE id=${id};`
  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)
    // 2. 执行 SQL 语句成功
    // console.log(results);
    res.send({
      status: 200,
      message: '删除数据成功！',
      data: results
    })
  })
}