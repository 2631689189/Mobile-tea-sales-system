<template>
  <div>
    <ul>
      <header>
        <i class='iconfont icon-fanhui' @click='$router.back()'></i>
        <span>个人中心</span>
        <i class='iconfont icon-kefu'></i>
      </header>
      <section>
        <div>
          <ul>
            <li>姓名：
              <input type="text"  v-model="name" >
            </li>
            <li>手机号：
              <input type="text"  v-model="tel">
            </li>
            <li>头像：
              <input type="text"  v-model="img">
            </li>
            <li>密码：
              <input class="inputpwd" type="text" value="修改密码请在意见箱中留言">
            </li>
            <div class="button">
              <p @click="save">保存修改</p>
            </div>
            <li class="bottom">修改信息后请重新登录刷新用户信息</li>
          </ul>
        </div>
      </section>
    </ul>
  </div>
</template>

<script>
import http from '@/common/api/request.js'
import qs from 'qs'
export default {
  name:'myinfo',
  data () {
    return {
      newData:[],
      name:'',
      tel:'',
      img:'',
      uid:''
    }
  },
  created() {
    this.getData()
  },
  methods: {
    async getData() {
      let info = await http.$axios({
        url:'/api/myinfo',
        method:"post",
        headers:{
          token:true
        }
      })
      this.newData = Object.freeze(info);
      this.name=info[0].nickName
      this.tel = info[0].tel
      this.img = info[0].imgUrl
      this.uid = info[0].id
    },
    save() {
      // console.log('new',this.name);
      let data = qs.stringify({
        name:this.name,
        tel :this.tel,
        img :this.img,
        uid :this.uid
      }
      )
      // console.log(data);
      http.$axios({
        url:'/api/saveinfo',
        method:'post',
        headers:{
          token:true
        },
        data:data
      })
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
  display: flex;
	flex-direction: column;
	align-items: left;
  ul{
    li{
      margin-left: 10px;
      width: 100%;
      height: 50px;
      line-height: 50px;
      // background-color: aqua;
      font-size: 15px;
      input{
        font-size: 18px;
      }
      .inputpwd{
        color: gainsboro;
      }
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
    .bottom{
      text-align: center;
      font-size: 20;
      color: firebrick;
    }
  }
}
</style>
