<template>
  <header>
    <div class="search-return" @click="goBack">
      <i class="iconfont icon-fanhui"></i>
    </div>
    <div class="search-main">
      <i class="iconfont icon-fangdajing"></i>
      <form action="" onsubmit="return false" @keyup.enter="goSearchList">
        <input type="search" placeholder="搜索您喜欢的产品..." v-model.trim="searchVal" style="color:black">
      </form>
    </div>
    <div class="search-btn" @click="goSearchList">搜索</div>
  </header>
</template>

<script>
import Header from '../home/Header.vue'

export default {
  components: { Header },
  data () {
    return {
      // v-model用户输入的数据
      searchVal:this.$route.query.key || '',
      // 本地存储的数据
      searchArr:[]
    }
  },
  methods:{
    goBack() {
      this.$router.back()
    },
    goSearchList() {
      // 判断如果用户没有输入值而点击了搜索，则直接return出去
      if(!this.searchVal) return
      // 判断用户之前有无搜索记录再本地存储中
      if(!localStorage.getItem('searchList')){
        // 如果用户没有搜素的本地历史，则创建一个名叫searchList的字符串用于在本地存储用户的记录
        localStorage.setItem('searchList','[]')
      }else{
        // 如果之前有用户的本地存储的搜索数据，则直接获取用户的数据进行渲染
        this.searchArr = JSON.parse(localStorage.getItem('searchList'))
      }
      // 当用户点击搜索后向数据里面增加数据,unshift表示往前放
      this.searchArr.unshift(this.searchVal)
      // es6去重操作
      let newArr = new Set(this.searchArr)
      // 向本地存储里面添加数据，并通过Array.from将字符串转换为数组
      localStorage.setItem("searchList",JSON.stringify(Array.from(newArr)))
      // 路径如果没有变化则不跳转页面
      if (this.searchVal === this.$route.query.key) return
      // 本地存储完后进行页面跳转
      this.$router.push({
        name:'list',
        // 将用户搜索的内容传递过去在搜索结果中渲染
        query:{
          key:this.searchVal
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
  height: 2.75rem;
  color: #fff;
  background-color:#b0352f;
  .search-return{
    padding: 0 .625rem;
    i{
      font-size: 1.55rem;
    }
  }
  .search-main{
    display: flex;
    align-items: center;
    width: 16.5rem;
    height: 1.875rem;
    border-radius: 12px;
    background-color: #fff;
    i{
      color: #708090;
      padding: 0 .625rem;
    }
    form{
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      input{
        width: 100%;
        font-size: 16px;
        padding: 0 6px;
      }
    }
  }
  .search-btn{
    padding: 0.625rem;
    font-size: .875rem;
  }
}
</style>
