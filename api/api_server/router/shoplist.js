const express = require('express')
// 创建路由对象
const router = express.Router()

// 导入分类商品路由处理函数模块
const userHandler = require('../router_handler/shoplist')

// 商品分类接口
router.get('/goods/shoplist', userHandler.shoplist)

// redis操作
router.post('/propelling', userHandler.propelling)

// 可视化操作
router.post('/echartslist', userHandler.echartslist)

// 获取用户信息
router.post('/myinfo', userHandler.myinfo)

// 修改用户信息
router.post('/saveinfo', userHandler.saveinfo)

// 提交意见
router.post('/submitinfo', userHandler.submitinfo)

// 用户留言信息
router.get('/getUserNews', userHandler.getUserNews)

// 删除留言信息
router.post('/deleteeUserNews', userHandler.deleteeUserNews)

module.exports = router
