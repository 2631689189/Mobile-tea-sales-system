<template>
  <div class="search-index">
    <Header></Header>
    <section>
      <div class="search-history" v-if="searchArr.length">
        <h2 class="iconfont icon-shijian">
          <span>历史搜索</span>
          <span class="iconfont icon-shanchu">
            <i @click="deleteStorage">清除历史记录</i>
          </span>
        </h2>
        <ul>
          <li v-for="(item,index) in searchArr" :key="index" @click="goSearchList(item)">{{item}}</li>
        </ul>
      </div>
      <div class="enen"  v-else>暂无搜索记录...</div>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
import Header from '@/components/search/Header.vue'
import Tabbar from '@/components/common/Tabbar.vue'
import { MessageBox } from 'mint-ui';
export default {
  name:'searchindex',
  data () {
    return {
      searchArr:[]
    }
  },
  components:{
    Tabbar,
    Header
  },
  // 接收本地的数据
  created() {
    this.searchArr = JSON.parse(localStorage.getItem('searchList')) || []
  },
  // 删除历史记录的事件
  methods:{
    deleteStorage(){
      MessageBox({
      title: '提示',
      message: '确定执行删除操作?',
      showCancelButton: true
      }).then(res=>{
        if(res == 'confirm'){
          // 删除本地存储
          localStorage.removeItem('searchList')
          // 清空数据
          this.searchArr = []
        }
      })
    },
    // 点击历史搜索结果进入搜索结果页面
    goSearchList(item){
      this.$router.push({
        name:'list',
        query:{
          key:item
        }
      })
    }
  }
}
</script>

<style lang="less" scoped>
  .search-index{
    display: flex;
    flex-direction: column;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    background-color: #f5f5f5;
    .search-history{
      padding: 1rem;
      h2{
        position: relative;
        font-size: 20px;
        font-weight: 500;
        margin-bottom: 10px;
        color: #b0352f;
        span{
          margin-left: .375rem;
          font-size: 15px;
          color: #000;
        }
      }
      ul{
        display: flex;
        // 水平排列
        flex-wrap: wrap;
        li{
          font-size: .875rem;
          border: 1px solid #ccc;
          padding: .1875rem .375rem;
          margin: 10px;
        }
      }
    }
    .enen{
      font-size: 1.25rem;
      padding: 10px;
    }
    .search-history h2 span:last-child{
      position: absolute;
      right: 0;
      color: #b0352f;
      font-size: 1.25rem;
      i{
        color: #000;
        font-size: .9375rem;
        margin-left: 6px;
      }
    }
  }
  </style>
  