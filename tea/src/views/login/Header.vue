<template>
  <div>
    <header>
      <div>
        <i class="iconfont icon-fanhui" @click="goback"></i>
      </div>
      <div>
        <slot>
          <span>登录</span>
        </slot>
      </div>
      <div>
        <i class="iconfont icon-shouye"></i>
      </div>
    </header>
  </div>
</template>

<script>

export default {
  data () {
    return {
    }
  },
  methods:{
    goback() {
      this.$router.go(-1)
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
  background-color: #b0352f;
  color: #fff;
  div{
    i{
      font-size: 1.375rem;
      padding: 0 .9375rem;
    }
    span{
      font-size: 1.125rem;
    }
  }
}
</style>
