const express = require('express')
// 创建路由对象
const router = express.Router()

// 导入首页商品路由处理函数模块
const userHandler = require('../router_handler/commodity')

// 获取首页推荐商品模块
router.get('/index_list/0/data/1', userHandler.regcommodity)

// 获取金骏眉模块数据
router.get('/index_list/1/data/1', userHandler.jinjunmei)

// 获取大红袍模块数据
router.get('/index_list/2/data/1', userHandler.dahonpao)

// 查询商品数据接口
router.get('/goods/qerylist', userHandler.goodslist)

// 登录接口
router.post('/login', userHandler.login)

// 发送信息接口
router.post('/code', userHandler.code)

// 新增用户接口
router.post('/addUser', userHandler.addUser)

// 注册用户接口
router.post('/register', userHandler.register)

// 添加购物车接口
router.post('/addCart', userHandler.addCart)

// 查询商品id的数据
router.get('/goods/id', userHandler.goodsid)

// 查询购物车数据
router.post('/selectCart', userHandler.selectCart)

// 删除购物车数据
router.post('/deleteCart', userHandler.deleteCart)

// 修改购物车数量
router.post('/updateNum', userHandler.updateNum)

// 修改收货地址
router.post('/addAddress', userHandler.addAddress)

// 查询收货地址
router.get('/selectAddress', userHandler.selectAddress)

// 删除收货地址
router.post('/deleteAddress', userHandler.deleteAddress)

// 生成订单
router.post('/addOrder', userHandler.addOrder)

// 查询订单号
router.post('/selectOrder', userHandler.selectOrder)

// 修改订单状态
router.post('/submitOrder', userHandler.submitOrder)

// 推荐模块获取数据
router.post('/information', userHandler.information)

// 订单界面获取数据
router.post('/getordernum', userHandler.getordernum)

// 后台获取数据
router.get('/getgoods', userHandler.getgoods)

// 修改商品数据
router.post('/editgoods', userHandler.editgoods)

// 后台删除数据库数据
router.post('/deleteedit', userHandler.deleteedit)

// 搜索后台数据
router.post('/searchedit', userHandler.searchedit)

// 后台添加数据
router.post('/addedit', userHandler.addedit)

// 支付错误订单状态
router.post('/paywrong', userHandler.paywrong)

// 支付成功修改订单数据
router.post('/paysuccess', userHandler.paysuccess)

// 获取用户信息
router.get('/getUserinfo', userHandler.getUserinfo)

// 后端搜索用户信息
router.post('/searchtel', userHandler.searchTel)

// 删除用户
router.post('/deleteeUser', userHandler.deleteeUser)

// 修改用户信息
router.post('/editUser', userHandler.editUser)

module.exports = router
