import { Indicator } from 'mint-ui';
import axios from 'axios'
import store from '@/store'
import router from '@/router'

export default {
  common: {
    method: 'GET',
    data: {},
    params: {},
    headers: {}
  },
  $axios(options = {}) {

    // 判断用户若输入了请求的方式、data、params则使用用户的，若用户没有则使用默认值
    options.method = options.method || this.common.method;
    options.data = options.data || this.common.data;
    options.params = options.params || this.common.params;
    options.headers = options.headers || this.common.headers;
    //请求前==》显示加载中...

    //是否是登录状态
    if (options.headers.token) {
      options.headers.token = store.state.user.token;
      if (!options.headers.token) {
        router.push('/login');
      }
    }
    // v->相当于发请求返回的数据
    return axios(options).then(v => {
      let data = v.data.data;
      return new Promise((res, rej) => {
        // 如果没有返回数据则return rej
        if (!v) return rej();
        //若有返回数据则 结束===》关闭加载中
        // 设置延迟关闭
        setTimeout(() => {
          Indicator.close();
        }, 200)
        res(data);
      })
    })

  }

}