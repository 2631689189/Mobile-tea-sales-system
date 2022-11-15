// 用这个包来生成 Token 字符串
const jwt = require('jsonwebtoken')

const bcrypt = require('bcryptjs')

// 导入数据库操作模块
const db = require('../db/index')
// 导入用户登录查询模块
var user = require('../db/userSql.js');
// 短信验证
var QcloudSms = require("qcloudsms_js");
// const { number } = require('joi');

// 推荐首页的处理函数
exports.regcommodity = (req, res) => {
  // sql语句
  const sql = 'SELECT * FROM my_db_01.ev_commdity; SELECT * FROM my_db_01.ev_swiper;SELECT * FROM my_db_01.ev_icons;SELECT * FROM my_db_01.ev_recommend;SELECT * FROM my_db_01.ev_like where states=1;'
  // 执行sql语句
  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)
    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '获取列表数据成功！',
      data: {
        // 首页顶部滑动数据
        topBar: [
          results[0]
        ],
        data: [
          // 轮播图
          {
            id: 0,
            type: 'swiperList',
            data: results[1]
          },
          // icons
          {
            id: 1,
            type: 'iconsList',
            data: results[2]
          },
          // 爆款推荐
          {
            id: 3,
            type: 'recommendList',
            data: results[3]
          },
          // 猜你喜欢
          {
            id: 4,
            type: 'likeList',
            data: results[4]
          }
        ]
      }
    })
  })
}

// 金骏眉的处理函数
exports.jinjunmei = (req, res) => {
  const sql = 'SELECT * FROM my_db_01.ev_jinjunmei;SELECT * FROM my_db_01.ev_icons;SELECT * FROM my_db_01.ev_like;'
  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)

    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '获取金骏眉数据成功！',
      data: [
        {
          id: 1,
          type: 'adList',
          data: results[0]
        },
        {
          id: 1,
          type: 'iconsList',
          data: results[1]
        },
        {
          id: 3,
          type: 'likeList',
          data: results[2]
        }
      ]
    })
  })

}

// 大红袍的处理函数
exports.dahonpao = (req, res) => {
  const sql = 'SELECT * FROM my_db_01.ev_dahonpao;SELECT * FROM my_db_01.ev_like;'

  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)

    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '获取大红袍数据成功！',
      data: [
        {
          id: 1,
          type: 'adList',
          data: results[0]
        },
        {
          id: 2,
          type: 'likeList',
          data: results[1]
        }
      ]
    })
  })

}

// 查询商品处理函数
exports.goodslist = (req, res) => {
  // 前端给后端的数据:orderName表示价格还是销量、order表示升序还是降序，name表示搜索的关键字
  let [searchList, orderName] = Object.keys(req.query)
  let [name, order] = Object.values(req.query)
  // console.log('order', order);
  const sql = 'SELECT * FROM my_db_01.ev_like where name LIKE "%' + name + '%" order by ' + orderName + ' ' + order + ' '
  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)

    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '获取查询结果成功！',
      data: results,
    })
  })

}

// 登录的处理函数
exports.login = (req, res) => {
  //后端要接收前端传递过来的值
  let params = {
    userTel: req.body.userTel,
    userPwd: req.body.userPwd
  };
  //查询用户手机号是否存在
  db.query(user.queryUserTel(params), function (error, results) {
    // 手机号存在
    if (results.length > 0) {
      db.query(`select * from my_db_01.ev_users where tel = '${params.userTel}'`, function (err, result) {
        // 获取用户加密的密码值
        let pwd = result[0].pwd
        const compareResult = bcrypt.compareSync(params.userPwd, pwd)
        if (!compareResult) {
          //手机号和密码都对
          res.send({
            code: 302,
            data: {
              success: false,
              msg: '失败',
            }
          })
        } else {
          //密码不对
          res.send({
            code: 200,
            data: {
              success: true,
              msg: '登录成功',
              data: result[0]
            }
          })
        }
      })

    }
    // else {
    //   //不存在
    //   res.send({
    //     code: 301,
    //     data: {
    //       success: false,
    //       msg: '手机号不存在'
    //     }
    //   })
    // }
  })
}

// 发送信息的处理函数
exports.code = (req, res) => {

  let tel = req.body.phone;

  // 短信应用SDK AppID
  var appid = 1400187558;  // SDK AppID是1400开头

  // 短信应用SDK AppKey
  var appkey = "dc9dc3391896235ddc2325685047edc7";

  // 需要发送短信的手机号码
  var phoneNumbers = [tel];

  // 短信模板ID，需要在短信应用中申请
  var templateId = 285590;  // NOTE: 这里的模板ID`7839`只是一个示例，真实的模板ID需要在短信控制台中申请

  // 签名
  var smsSign = "您的快捷登录密码为六个六";  // NOTE: 这里的签名只是示例，请使用真实的已申请的签名, 签名参数使用的是`签名内容`，而不是`签名ID`

  // 实例化QcloudSms
  var qcloudsms = QcloudSms(appid, appkey);

  // 设置请求回调处理, 这里只是演示，用户需要自定义相应处理回调
  function callback(err, ress, resData) {
    if (err) {
      console.log("err: ", err);
    } else {
      res.send({
        code: 200,
        data: {
          success: true,
          data: ress.req.body.params[0]
        }
      })
    }
  }
  var ssender = qcloudsms.SmsSingleSender();
  //这个变量：params 就是往手机上，发送的短信
  var params = [Math.floor(Math.random() * (9999 - 1000)) + 1000];
  ssender.sendWithParam(86, phoneNumbers[0], templateId,
    params, smsSign, "", "", callback);  // 签名参数不能为空串

}

// 添加用户的处理函数
exports.addUser = (req, res) => {
  let params = {
    userTel: req.body.phone
  }
  //查询用户是否存在
  db.query(user.queryUserTel(params), function (error, results) {
    if (error) throw error;
    //用户存在
    if (results.length > 0) {
      res.send({
        code: 200,
        data: {
          success: true,
          msg: '登录成功',
          data: results[0]
        }
      })
    } else {
      //不存在，新增一条数据
      db.query(user.inserData(params), function (err, result) {
        db.query(user.queryUserTel(params), function (e, r) {
          res.send({
            code: 201,
            data: {
              success: true,
              msg: '登录成功',
              data: r
            }
          })
        })
      })
    }
  })
}

// 注册用户的处理函数
exports.register = (req, res) => {
  let params = {
    userTel: req.body.phone,
    userPwd: req.body.pwd
  }
  //查询用户是否存在
  db.query(user.queryUserTel(params), function (error, results) {
    if (error) throw error;
    //用户存在
    if (results.length > 0) {
      res.send({
        code: 200,
        data: {
          success: true,
          msg: '登录成功',
          data: results
        }
      })
    } else {
      //不存在，新增一条数据
      db.query(user.inserData(params), function (err, result) {
        db.query(user.queryUserTel(params), function (e, r) {
          res.send({
            code: 201,
            data: {
              success: true,
              msg: '登录成功',
              data: r
            }
          })
        })
      })
    }
  })
}

// 商品详情id
exports.goodsid = (req, res) => {
  let id = req.query.id;
  //  token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  // console.log(id);
  // console.log(tokenObj);
  //查询用户
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    // console.log('uid', uId);
    // let uId = 18
    db.query('select * from my_db_01.ev_like where id=' + id + '', function (error, results) {
      if (error) throw error;
      let type = results[0].type
      // console.log(type);
      db.query(`update  my_db_01.cl_useraction set numbe=numbe+1 where typeof=${type} and uId=${uId}`, function (e, r) {
        // console.log('运行了');
        if (r.changedRows != 1) {
          db.query(`insert into  my_db_01.cl_useraction (uId,numbe,typeof) values ('${uId}',1,'${type}')`, function (ee, rr) {
          })
        }
        res.json({
          code: 200,
          data: results[0]
        })
      })
    })
  })
}

// 添加购物车
exports.addCart = (req, res) => {
  //后端接收前端的参数
  let goodsId = req.body.goodsId;
  let identifier = req.body.identifier
  // console.log('goodsid');
  // console.log(goodsId);
  //  token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  //查询用户
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    //查询商品
    db.query(`select * from my_db_01.ev_like where id=${goodsId}`, function (err, result) {
      let goodsName = result[0].name;
      let goodsPrice = result[0].price;
      let goodsImgUrl = result[0].imgUrl;
      //查询当前用户在之前是否添加过本商品
      db.query(`select * from my_db_01.cl_usercart where uId=${uId} and goods_id=${goodsId}`, function (e, r) {
        //用户之前是添加过商品到购物车
        if (r.length > 0) {
          let num = r[0].goods_num;
          db.query(`update my_db_01.cl_usercart set goods_num = replace(goods_num,${num},${parseInt(num) + 1}) where id = ${r[0].id}`, function (e, datas) {
            res.send({
              data: {
                code: 200,
                success: true,
                msg: '添加成功'
              }
            })
          })
        } else {
          //没有
          db.query(`insert into my_db_01.cl_usercart (uId,goods_id,goods_name,goods_price,goods_num,goods_imgUrl,identifier) values ("${uId}","${goodsId}","${goodsName}","${goodsPrice}","1","${goodsImgUrl}",'${identifier}')`, function () {
            res.send({
              data: {
                code: 200,
                success: true,
                msg: '添加成功'
              }
            })
          })
        }
      })
    })
  })
}

// 查询购物车数据
exports.selectCart = (req, res) => {
  //token
  let token = req.headers.token;
  console.log('token', token);
  console.log(token.length);
  let tokenObj = jwt.decode(token);
  if (token.length > 10) {
    console.log('执行token');
    //查询用户
    db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
      //用户id
      let uId = results[0].id;
      //查询购物车
      db.query(`select * from my_db_01.cl_usercart where uId = ${uId}`, function (err, result) {
        res.send({
          data: {
            code: 200,
            success: true,
            data: result
          }
        })
      })
    })
  } else {
    res.send({
      data: {
        code: 200,
        success: false,
      }
    })
  }
}

// 删除购物车数据
exports.deleteCart = (req, res) => {
  let arrId = req.body.arrId;
  // 当用户多选删除时循环删除
  db.query(`delete from my_db_01.cl_usercart where id = ${arrId}`, function (error, results) {
    res.send({
      data: {
        code: 200,
        success: true,
        msg: '删除成功'
      }
    })
  })

}

// 修改购物车数量
exports.updateNum = (req, res) => {
  let id = req.body.id;
  let changeNum = req.body.num;
  // console.log(id, changeNum);
  db.query(`select * from my_db_01.cl_usercart where id = ${id}`, function (error, results) {
    //原来的数量
    let num = results[0].goods_num;
    db.query(`update my_db_01.cl_usercart set goods_num = replace(goods_num,${num},${changeNum}) where id = ${id}`, function (err, result) {
      res.send({
        data: {
          code: 200,
          success: true
        }
      })
    })

  })
}

// 新增收货地址数据
exports.addAddress = (req, res) => {
  //token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  //拿到前端给后端传入的数据
  let body = req.body;
  let [name, tel, province, city, county, addressDetail, isDefault, areaCode] = [
    body.name,
    body.tel,
    body.province,
    body.city,
    body.county,
    body.addressDetail,
    body.isDefault,
    body.areaCode
  ];
  //查询用户
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    //增加一条收货地址
    if (isDefault != 1) {
      db.query(`insert into my_db_01.cl_address (uId,name,tel,province,city,county,addressDetail,isDefault,areaCode) values (${uId},"${name}","${tel}","${province}","${city}","${county}","${addressDetail}","${isDefault}","${areaCode}")`, function (err, result) {
        res.send({
          data: {
            code: 200,
            success: true,
            msg: '收货地址添加成功'
          }
        })
      })
    } else {
      db.query(`select * from my_db_01.cl_address where uId = ${uId} and isDefault = ${isDefault}`, function (err, result) {
        if (result.length > 0) {
          let addressId = result[0].id;
          db.query(`update my_db_01.cl_address set isDefault = replace(isDefault,'1','0') where id = ${addressId}`, function () {
            db.query(`insert into my_db_01.cl_address (uId,name,tel,province,city,county,addressDetail,isDefault,areaCode) values (${uId},"${name}","${tel}","${province}","${city}","${county}","${addressDetail}","${isDefault}","${areaCode}")`, function (e, r) {
              res.send({
                data: {
                  code: 200,
                  success: true,
                  msg: '收货地址添加成功'
                }
              })
            })
          })
        } else {
          db.query(`insert into my_db_01.cl_address (uId,name,tel,province,city,county,addressDetail,isDefault,areaCode) values (${uId},"${name}","${tel}","${province}","${city}","${county}","${addressDetail}","${isDefault}","${areaCode}")`, function (err, result) {
            res.send({
              data: {
                code: 200,
                success: true,
                msg: '收货地址添加成功'
              }
            })
          })
        }
      })
    }
  })
}

// 查询收货地址
exports.selectAddress = (req, res) => {
  //token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  // console.log(tokenObj);
  //查询用户
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    // console.log(results);
    db.query(`select * from my_db_01.cl_address where uId = ${uId}`, function (err, result) {
      // console.log(uId);
      res.send({
        data: {
          code: 200,
          success: true,
          msg: '查询成功',
          data: result
        }
      })
    })
  })
}

// 删除收货地址
exports.deleteAddress = (req, res) => {
  let id = req.body.id;
  // console.log(id);
  db.query(`delete from my_db_01.cl_address where id = ${id}`, function (error, results) {
    res.send({
      data: {
        code: 200,
        success: true,
        msg: '删除成功'
      }
    })
  })
}

// 生成订单
exports.addOrder = (req, res) => {
  //token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  //前端给后端的数据
  let goodsArr = req.body;
  // console.log(goodsArr);
  //生成订单号order_id，规则：时间戳 + 6为随机数
  function setTimeDateFmt(s) {
    return s < 10 ? '0' + s : s
  }
  function randomNumber() {
    const now = new Date();
    let month = now.getMonth() + 1;
    let day = now.getDate();
    let hour = now.getHours();
    let minutes = now.getMinutes();
    let seconds = now.getSeconds();
    month = setTimeDateFmt(month);
    day = setTimeDateFmt(day);
    hour = setTimeDateFmt(hour);
    minutes = setTimeDateFmt(minutes);
    seconds = setTimeDateFmt(seconds);
    let orderCode = now.getFullYear().toString() + month.toString() + day + hour + minutes + seconds + (Math.round(Math.random() * 1000000)).toString();
    return orderCode;
  }
  /*
  未支付：1
  待支付：2
  支付成功：3
  支付失败：4 | 0
  */
  //商品列表名称
  // console.log('生成订单', goodsArr);
  let goodsimgUrl = goodsArr.goods_imgUrl
  // 商品id
  let goodsid = goodsArr.id

  // 商品编号
  let identifier = goodsArr.identifier

  // 商品名
  let goodsName = [goodsArr.goods_name];
  //订单商品总金额
  let goodsPrice = goodsArr.goods_price * goodsArr.goods_num;
  //订单商品总数量
  let goodsNum = goodsArr.goods_num;
  // 订单号
  let orderId = randomNumber();
  // goodsArr.forEach(v => {
  //   goodsName.push(v.goods_name);
  //   goodsPrice += 68 * 3;
  //   goodsNum += parseInt(3);
  // })

  // 对订单号进行加密
  let order = bcrypt.hashSync(orderId, 5);
  // console.log(order);
  //查询当前用户
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    db.query(`insert into my_db_01.cl_order (order_id,goods_name,goods_price,goods_num,order_status,uId,imgUrl,identifier,orderpwd) values ('${orderId}','${goodsName}','${goodsPrice}','${goodsNum}','1',${uId},'${goodsimgUrl}','${identifier}','${order}')`, function () {
      db.query(`select * from my_db_01.cl_order where uId = ${uId} and order_id='${orderId}'`, function (err, result) {
        // 当用户点击去结算后将购物车里面的相对应的数据删除掉
        db.query(`delete from my_db_01.cl_usercart where id=${goodsid}`, function (e, r) {
          res.send({
            data: {
              success: true,
              code: 200,
              data: result
            }
          })
        })
      })
    })
  })
}

// 查询订单号
exports.selectOrder = (req, res) => {
  //接收前端给后端的订单号
  let orderId = req.body.orderId;
  db.query(`select * from my_db_01.cl_order where order_id='${orderId}'`, function (err, result) {
    res.send({
      data: {
        success: true,
        code: 200,
        data: result
      }
    })
  })
}

// 修改订单状态
exports.submitOrder = (req, res) => {
  //token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  //订单号
  let orderId = req.body.orderId;
  //购物车选中的商品id
  // let shopArr = req.body.shopArr;
  let shopArr = [3, 5]
  // console.log('----', shopArr);
  //查询用户
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    db.query(`select * from my_db_01.cl_order where uId = ${uId} and order_id = ${orderId}`, function (err, result) {
      //订单的数据库id
      let id = result[0].id;
      //修改订单状态 1==>2
      db.query(`update my_db_01.cl_order set order_status = replace(order_status,'1','2') where id = ${id}`, function (e, r) {
        // 查看订单数据
        db.query(`SELECT * FROM my_db_01.cl_order where order_id='${orderId}'`, function (ee, rr) {
          //购物车数据删除
          res.send({
            status: 200,
            success: true,
            message: '修改订单状态成功',
            data: rr
          })
        })
      })
    })
  })
}

// 支付错误订单状态
exports.paywrong = (req, res) => {
  let id = req.body.id
  // console.log(id);
  const sql = `update my_db_01.cl_order set order_status=${3} where order_id=${id}`
  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)
    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '更改数据成功！',
    })
  })
}

// 支付成功订单状态
exports.paysuccess = (req, res) => {
  let id = req.body.id
  // console.log(id);
  const sql = `update my_db_01.cl_order set order_status=${4} where order_id=${id}`
  db.query(sql, (err, results) => {
    // 查询订单
    db.query(`SELECT * FROM my_db_01.cl_order where order_id=${id}`, function (e, r) {
      // 1. 执行 SQL 语句失败
      if (err) return res.cc(err)
      // 2. 执行 SQL 语句成功
      let identifier = r[0].identifier
      let num = r[0].goods_num
      // 根据订单编号减少库存
      db.query(`update my_db_01.ev_like set numbe=numbe-${num} where identifier=${identifier}`, function (ee, rr) {
        res.send({
          status: 200,
          message: '更改数据成功！',
          data: r
        })
      })
    })
  })
}

// 推荐模块获取数据
exports.information = (req, res) => {
  //token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  // console.log(tokenObj);
  //查询用户
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    let numbe = 10
    const redis = require('redis')
    const client = redis.createClient() //创建客户端
    // 监听错误信息
    client.on('err', err => {
      console.log('redis client error:', err);
    })
    client.connect(6379, '127.0.0.1').then(
      () => {
        let a = []
        // 查询redis库中的数据，获取返回值
        async function fn() {
          client.SRANDMEMBER(`recommend:${uId}`).then(val => {
            a.push(val)
            console.log('01');
            console.log(a);
            if (a.length > 9) {
              let id1 = a[0]
              let id2 = a[1]
              let id3 = a[2]
              let id4 = a[3]
              let id5 = a[4]
              let id6 = a[5]
              let id7 = a[6]
              let id8 = a[7]
              let id9 = a[8]
              let id10 = a[9]
              console.log(id1, id2, id3, id4, id5, id10);
              const sql = `SELECT * FROM my_db_01.ev_like where id=${id1};SELECT * FROM my_db_01.ev_like where id=${id2};SELECT * FROM my_db_01.ev_like where id=${id3};
              SELECT * FROM my_db_01.ev_like where id=${id4};SELECT * FROM my_db_01.ev_like where id=${id5};SELECT * FROM my_db_01.ev_like where id=${id6};
              SELECT * FROM my_db_01.ev_like where id=${id7};SELECT * FROM my_db_01.ev_like where id=${id8};SELECT * FROM my_db_01.ev_like where id=${id9};
              SELECT * FROM my_db_01.ev_like where id=${id10}`
              db.query(sql, (err, resultss) => {
                // 1. 执行 SQL 语句失败
                if (err) return res.cc(err)
                res.send({
                  status: 200,
                  message: '推荐成功',
                  data: [
                    {
                      id: 0,
                      data: resultss[0]
                    },
                    {
                      data: resultss[1]
                    },
                    {
                      data: resultss[2]
                    },
                    {
                      data: resultss[3]
                    },
                    {
                      data: resultss[4]
                    },
                    {
                      data: resultss[5]
                    },
                    {
                      data: resultss[6]
                    },
                    {
                      data: resultss[7]
                    },
                    {
                      data: resultss[8]
                    },
                    {
                      data: resultss[9]
                    },
                  ]
                  // })
                })
              })
            }
          })
        }
        for (let i = 0; i < 10; i++) {
          console.log('02');
          // 调用方法
          fn()
        }
        // console.log('03');
      })

    // db.query(`select * from my_db_01.cl_useraction where uId = ${uId}`, function (err, result) {
    //   let type = result[0].typeof
    //   let type2 = result[1].typeof
    //   let type3 = result[2].typeof
    //   // console.log(type, type2, type3);
    //   db.query(`SELECT * FROM my_db_01.ev_like where type=${type} or type=${type2} or type=${type3}`, function (er, re) {
    //     res.send({
    //       status: 200,
    //       message: '获取推荐数据成功',
    //       data: re
    //     })
    //   })
    // })
  })
}

// 订单处理函数
exports.getordernum = (req, res) => {
  //token
  let token = req.headers.token;
  let tokenObj = jwt.decode(token);
  //查询用户
  db.query(`select * from my_db_01.ev_users where tel = ${tokenObj.tel}`, function (error, results) {
    //用户id
    let uId = results[0].id;
    db.query(`SELECT * FROM my_db_01.cl_order where uId = ${uId}`, function (e, r) {
      res.send({
        status: 200,
        message: '获取订单数据成功',
        data: r
      })
    })
  })
}

// 后台获取数据
exports.getgoods = (req, res) => {
  const sql = 'SELECT * FROM my_db_01.ev_like'
  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)

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

// 编辑后台数据
exports.editgoods = (req, res) => {
  let id = req.body.id
  let name = req.body.name
  let price = req.body.price
  let states = req.body.states
  let numbe = req.body.numbe
  let imgUrl = req.body.imgUrl
  let identifier = req.body.identifier
  // console.log(req.body);
  const sql = `update my_db_01.ev_like set price=${price},states=${states},name='${name}',imgUrl='${imgUrl}', numbe=${numbe}, identifier='${identifier}' where id=${id}`
  db.query(sql, (err, results) => {
    // 1. 执行 SQL 语句失败
    if (err) return res.cc(err)
    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '更改数据成功！',
      data: results
    })
  })
}

// 后台删除数据库数据
exports.deleteedit = (req, res) => {
  let id = req.body.indexid;
  const sql = `DELETE FROM my_db_01.ev_like WHERE id=${id};`
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

// 搜索后台数据
exports.searchedit = (req, res) => {
  let name = req.body.name
  const sql = `SELECT * from  my_db_01.ev_like where name like "%${name}%" `
  db.query(sql, (err, results) => {
    if (err) return res.cc(err)
    res.send({
      status: 200,
      message: '查询成功',
      data: results
    })
  })
}

// 后台添加数据
exports.addedit = (req, res) => {
  let name = req.body.name
  let imgUrl = req.body.imgUrl
  let price = req.body.price
  let numbe = req.body.numbe
  let states = req.body.states
  let typeo = req.body.typeof
  let letter = req.body.desc

  const sql = `insert into  my_db_01.ev_like (imgUrl,name,price,numbe,states,letter,type) values ('${imgUrl}','${name}',${price},${numbe},${states},'${letter}','${typeo}');`
  db.query(sql, (err, results) => {
    if (err) return res.cc(err)
    res.send({
      status: 200,
      message: '添加数据成功',
      data: results
    })
  })
}

// 后台获取用户信息
exports.getUserinfo = (req, res) => {
  db.query(`SELECT * FROM my_db_01.ev_users`, function (error, results) {
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

// 后台搜索用户信息
exports.searchTel = (req, res) => {
  let tel = req.body.name
  db.query(`SELECT * FROM my_db_01.ev_users where tel=${tel} `, function (error, results) {
    // 1. 执行 SQL 语句失败
    if (error) return res.cc(error)
    // 2. 执行 SQL 语句成功
    res.send({
      status: 200,
      message: '查询成功',
      data: results
    })
  })
}

// 删除用户
exports.deleteeUser = (req, res) => {
  let id = req.body.indexid;
  const sql = `DELETE FROM my_db_01.ev_users WHERE id=${id};`
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

// 编辑用户信息
exports.editUser = (req, res) => {
  // console.log(req.body);
  let id = req.body.id
  let name = req.body.nickName
  let tel = req.body.tel
  let pwd = req.body.pwd
  let imgUrl = req.body.imgUrl
  // console.log(pwd.length);
  if (pwd.length > 10) {
    db.query(`update my_db_01.ev_users set nickName='${name}',tel='${tel}',imgUrl='${imgUrl}' where id=${id}`, function (error, results) {
      // 1. 执行 SQL 语句失败
      if (error) return res.cc(error)
      res.send({
        status: 200,
        message: '更改数据成功！',
        data: results
      })
    })
  } else {
    // 用户密码加密
    let userpwd = bcrypt.hashSync(pwd, 5);
    console.log(userpwd);
    db.query(`update my_db_01.ev_users set nickName='${name}',tel='${tel}',imgUrl='${imgUrl}',pwd='${userpwd}' where id=${id}`, function (error, results) {
      // 1. 执行 SQL 语句失败
      if (error) return res.cc(error)
      res.send({
        status: 200,
        message: '更改数据成功！',
        data: results
      })
    })
  }
}