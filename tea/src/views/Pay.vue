<template>
  <div>
    <header>
        <i class='iconfont icon-fanhui' @click='$router.back()'></i>
        <span>支付订单</span>
        <i class='iconfont icon-kefu'></i>
    </header>
    <section>
      <div class="top">您总共需要支付
        <i>
        ￥{{this.price}}
        </i>
        <br>
        <span>
          请支付宝扫码付款
        </span>
      </div>
      <div class="center">
        <img src="@/assets/images/zfb.jpg" alt="">
      </div>
      <div class="bottom">
        <button @click="wrong(orderid)">支付遇到问题</button>
        <button @click="success(orderid)">已完成支付</button>
      </div>
    </section>
  </div>
</template>

<script>
import http from '@/common/api/request.js'
import qs from 'qs'
export default {
  name:'Pay',
  data () {
    return {
    }
  },
  created() {
    // 接收路径传参的值
    this.orderid=this.$route.query.orderid
    this.price=this.$route.query.orderprice
    this.identifier=this.$route.query.identifier
    // this.identifier=JSON.parse(this.$route.query.identifier)
    console.log('成功', this.identifier);
    // this.dataOrder = JSON.parse(this.$route.query.dataOrder)
    // console.log(this.orderid);
  },
  methods:{
    wrong(orderid){
      // console.log(id);
      let data = qs.stringify({
        id:orderid
      })
      // console.log('pay-错误',data);
      http.$axios({
        url:'/api/paywrong',
        method:"post",
        data:data
      })
    },
    success(orderid) {
      let data = qs.stringify({
        id:orderid,
      })
      // console.log('pay-成功',data);
      http.$axios({
        url:'/api/paysuccess',
        method:"post",
        data:data
      }).then(res=> {
        // console.log(res);
        this.$router.push({
          path:'/ordernum',
          // query:{

          // }
        })
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
      font-size:0.986666rem;
  }
  span{
      font-weight:300;
      font-size:0.98rem;
  }
}
section{
  width: 100%;
  height: 800px;
  .top{
    text-align: center;
    margin-top: 30px;
    margin-bottom: 15px;
    font-size: 25px;
    i{
      color: #b0352f;
    }
  }
  .center{
    text-align:center;
    img{
      width: 300px;
      height: 300px;
    }
  }
  .bottom{
    margin-left: 10%;
    width: 80%;
    height: 150px;
    display: flex;
    justify-content:space-between;
    button{
      width: 100px;
      height: 45px;
      font-size: 15px;
    }
  }
}
</style>
