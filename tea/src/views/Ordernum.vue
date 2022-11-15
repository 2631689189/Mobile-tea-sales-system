<template>
  <div>
    <header>
        <i class='iconfont icon-fanhui' @click='goback()'></i>
        <span>订单</span>
        <i class='iconfont icon-kefu'></i>
    </header>
    <section>
      <div>
        <ul>
          <li v-for="(item, index) in newData" :key="index">
            <span class="top">
              订单号：{{item.order_id}}
            </span>
            <div>
              <div class="left">
                <img :src='item.imgUrl' alt="">
              </div>
              <div class="center">
                <div>{{item.goods_name}}</div>
                <span>x{{item.goods_num}}</span>
                <p>
                  <i>￥</i>
                  <span>{{item.goods_price}}</span>
                </p>
              </div>
              <div class="right">
                <span v-if="item.order_status == 4">
                  已付款
                </span>
                <span v-else-if="item.order_status == 3">
                  交易失败
                </span>
                <span v-else-if="item.order_status == 2">
                  待付款
                </span>
                <span v-else-if="item.order_status == 1">
                  未付款
                </span>
              </div>
            </div>
          </li>  
        </ul>
      </div>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
import Tabbar from '@/components/common/Tabbar.vue';
import http from '@/common/api/request.js'
export default {
  data () {
    return {
      newData:[]
    }
  },
  components:{
    Tabbar
  },
  created() {
    this.getData()
  },
  methods:{
    async getData() {
      let res = await http.$axios({
        url:'/api/getordernum',
        method:"post",
        headers:{
          token:true
        }
      })
      this.newData = Object.freeze(res);
      // console.log(this.newData);
    },
    goback(){
      this.$router.push('/my');
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
  // height: 100vh;
  margin-bottom: 60px;
  ul{
    // padding: 0,15px,0 15px;
    margin-right: 15px;
    margin-left: 15px;
    li{
      margin-top: 15px;
      height: 110px;
      background-color: #f3f3f3;
      border-radius: 10px;
      .top{
          margin-top: 5px;
          margin-left: 5px;
          font-size: 10px;
          z-index: 99;
          // width: 20px;
          // height: 10px;
          // background-color: aquamarine;
          // overflow: hidden;
          // white-space: nowrap;
          // text-overflow: ellipsis;
        }
      div{
        display: flex;
        justify-content: space-between;
        margin-top: 5px;
        .left{
          margin-left: 10px;
          width: 80px;
          height: 80px;
          // background-color: aqua;
          img{
            margin-top: -10px;
            width: 100px;
            height: 100px;
          }
        }
        .center{
          width: 150px;
          height: 60px;
          // background-color: aquamarine;
          // line-height: 60px;
          display: flex;
          flex-direction: column;
          font-size: 14px;
          p{
            color: #b0352f;
            i{
              font-size: 15px;
            }
            span{
              font-size: 20px;
            }
          }
        }
        .right{
          margin-right: 10px;
          height: 80px;
          line-height: 60px;
          font-size: 15px;
          color: #b0352f;
        }
      }
    }
  }
}
</style>
