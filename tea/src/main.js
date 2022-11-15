import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// 公共css文件
import './assets/css/common.css'

// 淘宝无线适配
// import './assets/js/flexible'
// 引入字体图表样式
import './assets/css/iconfont.css'

// 引入tab组件
import LyTab from 'ly-tab'
Vue.use(LyTab)


// 引入全部组件mint-ui
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'

Vue.use(MintUI)

//全局引入vant 
import Vant from 'vant';
import 'vant/lib/index.css';
Vue.use(Vant);


Vue.config.productionTip = false

new Vue({
  router: router,
  store: store,
  render: h => h(App),
}).$mount('#app')
