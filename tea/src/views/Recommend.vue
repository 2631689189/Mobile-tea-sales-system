<template>
  <div>
    <header>
        <i class='iconfont icon-fanhui' @click='$router.back()'></i>
        <span>热门推荐</span>
        <i class='iconfont icon-kefu'></i>
    </header>
    <section>
      <ul>
        <li v-for="(item, index) in newData" :key="index">
          <h2>
            <img :src='item.data[0].imgUrl' alt="" @click="godetail(item.data[0].id)">
          </h2>
          <h3>{{item.data[0].name}}</h3>
          <div>
            <span>¥</span>
            <b>{{item.data[0].price}}</b>
          </div>
        </li>
      </ul>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
import Tabbar from '@/components/common/Tabbar.vue';
  // axios的二次封装
import http from '@/common/api/request'
export default {
  name:'recommend',
  data () {
    return {
      newData:[]
    }
  },
  components:{
    Tabbar
  },
  // 页面加载调用
  created() {
    // console.log(newData);
    this.getData()
  },
  methods: {
    async getData() {
      let res = await http.$axios({
        url:'/api/information',
        method:'post',
        headers:{
          token:true
        }
      })
      this.newData =Object.freeze(res);
      console.log(this.newData[0].data[0].imgUrl);
    },
    godetail(id) {
      this.$router.push({
        path:'/detail',
        query:{
          id
        }
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
  margin-bottom: 100px;
  ul{
    display: flex;
    // 将盒子按宽度排列，当父盒子宽度不足时，换行
    flex-wrap: wrap;
    li{
      display: flex;
      // 将属性竖直排列
      flex-direction: column;
      // 在父盒中居中显示
      justify-content: center;
      align-items: center;
      width: 50%;
      h2{
        img{
          width: 11rem;
          height: 11rem;
        }
        img[lazy=loading] {
          background-color: #f7f7ff;
        }
      }
      h3{
        width: 100%;
        font-size: 14px;
        padding: .375rem;
        margin-left: .625rem;
        color: #222;
        font-weight: 400;
        // 指定如果内容溢出一个元素的框，会发生什么。
        overflow: hidden;
        // 指定当文本溢出包含它的元素时，应该如何显示
        text-overflow: ellipsis;
        // 设置不换行
        white-space: nowrap;
      }
      div{
        width: 93%;
        text-align: left;
        padding: 0 .375rem .625rem .375rem;
        color: #b0352f;
        span{
          font-size: 1rem;
        }
        b{
          font-size: 1.2rem;

        }
      }
    }
  }
}
Tabbar{

}
</style>
