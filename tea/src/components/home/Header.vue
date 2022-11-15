<template>
  <div class="header">
    <a href="#">
      <img src="@/assets/images/logo.png" alt="">
    </a>
    <div class="search" @click="goSearch">
        <i class="iconfont icon-fangdajing"></i>
        <span>点击搜索...</span>
      </div>
    <div class="artificial">
      <i class="iconfont icon-kefu">
      </i>
    </div>
  </div>
</template>

<script>

export default {
  data () {
    return {
    }
  },
  methods:{
    goSearch() {
      this.$router.push('/search')
    }
  }
}
</script>

<style lang="less" scoped>
  .header{
    // 弹性布局
    display: flex;
    justify-content: space-around;
    align-items:center;
    z-index: 99;
    width:100%;
    height: 3.125rem;
    background-color: #b0352f;
    a{
      max-width: 6.25rem;
      max-height: 4.375rem;
      margin-right: .625rem;
      margin-left: .3125rem;
      img{
        margin-top: -0.625rem;
        width: 100%;
        height: 100%;
      }
    }
    .search{
      display: flex;
      align-items: center;
      width: 15.375rem;
      height: 1.875rem;
      background-color:white ;
      border-radius: .75rem;
      margin-right: .625rem;
      // padding: 8px;
        i{
          font-size: 1.5625rem;
          margin: 0 .625rem 0 .625rem;
          color: #ccc;
          // margin-bottom: 20px;
        }
        span{
          font-size: 1.25rem;
          color: #ccc;
        }    
    }
    .artificial{
      align-items: center;
      margin-right: .3125rem;
      i{
        font-size: 1.5625rem;
        color: white;
      }
    }
  }


</style>
