<template>
  <div>
    <div class="tabbar">
    <ul class="ul-tabbar">
      <li v-for="(round, index) in routerList" :key="index" @click="switchTab(round.path)">
        <i :class="$route.path.includes(round.path) ? 'active2':'' ">
          <p :class="round.icon"></p>
          <span>{{round.title}}</span>
        </i>
      </li>
    </ul>
  </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      active : -1,
      routerList:[
        {
          title:'首页',
          path:'/home',
          icon:'iconfont icon-shouye'
        },
        {
          title:'分类',
          path:'/list',
          icon:'iconfont icon-fenlei'
        },
        {
          title:'推荐',
          path:'/recommend',
          icon:'iconfont icon-xihuan'
        },
        {
          title:'购物车',
          path:'/cart',
          icon:'iconfont icon-gouwuche'
        },
        {
          title:'我的',
          path:'/my',
          icon:'iconfont icon-wode'
        }
      ]
    }
  },
  methods:{
    switchTab(path) {
      // 判断点击的路径是否是当前路径，是则不跳转
      if(this.$route.path == path) return
      this.$router.replace(path)
    }
  }
}
</script>

<style lang="less" scoped>
.tabbar{
  // 固定在底部
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  // 权重
  z-index: 999;
  background-color: white;
  .ul-tabbar{
    // 弹性布局，平均分布
    display: flex;
    justify-content: space-around;
    font-size: .5rem;
    li{
      color: #666666;
      text-align: center;
      p{
      font-size: 1.3rem;
      }
      .active2{
        color: #b0352f;
      }
    }
  }
}
</style>
