import Vue from 'vue'
import VueRouter from 'vue-router'
// 引入组件
import Home from '../views/Home.vue'
import List from '@/views/List'
import Cart from '@/views/Cart'
import My from '@/views/My'
import Search from '@/views/Search'
import Recommend from '@/views/Recommend.vue'
import Detail from '@/views/Detail.vue'
import Login from '@/views/login/Login.vue'
import UserLogin from '@/views/login/UserLogin.vue'
import Register from '@/views/login/Register.vue'
import Path from '@/views/Path.vue'
import Order from '@/views/Order.vue'
import Pay from '@/views/Pay.vue'
import Ordernum from '@/views/Ordernum'
import Myinfo from '@/views/Myinfo.vue'
import Idea from '@/views/Idea.vue'

// 二级路由组件
import searchIndex from '../views/search/search-index'
import SearchList from '@/views/search/Search-list'
import Pathindex from '@/views/path/Path-index.vue'
import PathList from '@/views/path/Path-List.vue'
Vue.use(VueRouter)


// 1.判断当前路由是否和访问的路由一样。一样则不跳转
// 2.在入口里面加对于router使用的时候，捕获异常。
const originalPush = VueRouter.prototype.push

VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

export default new VueRouter({
  routes: [
    {
      path: '/idea',
      component: Idea,
      meta: { isShow: true },
    },
    {
      path: '/myinfo',
      component: Myinfo,
      meta: { isShow: true },
    },
    {
      path: '/ordernum',
      component: Ordernum,
      meta: { isShow: true },
    },
    {
      path: '/pay',
      component: Pay,
      meta: { isShow: true },
    },
    {
      path: '/order',
      component: Order,
      meta: {
        isShow: true,
        keepAlive: true
      },
    },
    {
      path: '/path',
      component: Path,
      meta: { isShow: true },
      children: [
        {
          path: '/',
          name: 'index',
          component: Pathindex
        },
        {
          path: '/pathlist',
          name: 'index',
          component: PathList
        },
      ]
    },
    {
      path: '/register',
      component: Register,
      meta: { isShow: true },
    },
    {
      path: '/userLogin',
      component: UserLogin,
      meta: { isShow: true },
    },
    {
      path: '/login',
      component: Login,
      meta: { isShow: true },
    },
    {
      path: '/detail',
      component: Detail,
      meta: { isShow: true },
    },
    {
      path: '/home',
      component: Home,
      meta: { isShow: true },
    },
    {
      path: '/list',
      component: List,
      meta: { isShow: true }
    },
    {
      path: '/my',
      component: My,
      meta: { isShow: true },
    },
    {
      path: '/cart',
      component: Cart,
      meta: { isShow: true },
    },
    {
      path: '/search',
      component: Search,
      meta: { isShow: true },
      children: [
        {
          path: '/',
          name: 'index',
          component: searchIndex
        },
        {
          path: '/list',
          name: 'list',
          component: SearchList
        }
      ]
    },
    {
      path: '/recommend',
      component: Recommend,
      meta: { isShow: true }
    },
    {
      path: '/',
      redirect: '/home'
    }
  ]
})

