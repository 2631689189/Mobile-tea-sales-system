<template>
  <div>
    <ul>
      <header>
        <i class='iconfont icon-fanhui' @click='$router.back()'></i>
        <span>留言箱</span>
        <i class='iconfont icon-kefu'></i>
      </header>
      <section>
        <ul>
          <li>您的邮箱:
            <input type="text" v-model="email" >
          </li>
          <li>电话号码:
            <input type="text" v-model="tel" >
          </li>
          <li>
            请填写您的意见：
          </li>
          <textarea cols="30" rows="10" v-model="propose"></textarea>
        </ul>
        <div class="button">
            <p @click="submit">提交</p>
        </div>
        <div>
          <span>
            <i class="iconfont icon-dianhua">电话</i>
              15968453694
          </span>
          <br>
          <span>
            <i class="iconfont icon-gongkaiyijianxiang">邮箱</i>
              56981685432@email.com
          </span>
          <br>
          <span>
            <i class="iconfont icon-dizhi">地址</i>
            中国广东省深圳市南山区深南大道10000号腾讯大厦
          </span>
        </div>
      </section>
    </ul>
  </div>
</template>

<script>
import http from '@/common/api/request.js'
import qs from 'qs'
export default {
  name:'idea',
  data () {
    return {
      email:'',
      tel:'',
      propose:''
    }
  },
  methods:{
    submit() {
      if(this.email.length !=0 && this.tel.length !=0 && this.propose.length !=0) {
          let data = qs.stringify({
            email:this.email,
            tel :this.tel,
            propose :this.propose,
          })
          http.$axios({
            url:'/api/submitinfo',
            method:"post",
            headers:{
              token:true
            },
            data:data
          })
        }else{
          return alert('不能有空值')
        }
      }
  }
}
</script>

<style lang="less" scoped>
header{
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  height: 3.173333rem;
  color:#fff;
  background-color: #b0352f;
  i{
      padding:0 0.4rem;
      font-size:1.286666rem;
  }
  span{
      font-weight:300;
      font-size:1.28rem;
  }
}
section{
  ul{
    li{
      padding: 5px;
      line-height: 50px;
      width: 100%;
      height: 50px;
      // background-color: aquamarine;
      font-size: 15px;
      input{
        width: 80%;
        // background-color: chartreuse;
      }
    }
    textarea{
      margin-left: 10px;
      // margin-right: 10px;
      width: 93%;
      height: 100px;
    }
  }
  div{
    margin-top: 30px;
    text-align: center;
  }
  .button{
      margin-top: 10px;
      margin-left: 35%;
      text-align: center;
      line-height: 50px;
      border-radius: 10px;
      width: 100px;
      height: 50px;
      color: #fff;
      font-size: 20px;
      background-color: #b0352f;
    }
}
</style>
