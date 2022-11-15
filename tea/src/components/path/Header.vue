<template>
  <header>
      <i class='iconfont icon-fanhui' @click='$router.back()'></i>
      <slot>
          <span>我的地址</span>
      </slot>
      <i class='iconfont icon-kefu'></i>
  </header>
</template>

<style lang='less' scoped>
header{
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  height: 2.75rem;
  color:#fff;
  background-color: #b0352f;
  i{
      padding:0 0.8rem;
      font-size:20px;
  }
  span{
      font-weight:300;
      font-size:1rem;
  }
}
</style>
