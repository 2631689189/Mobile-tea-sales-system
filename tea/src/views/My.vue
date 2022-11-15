<template>
  <div class="my container">
    <Header>
      <div class='user-info' v-if='loginStatus'>
				<img :src="userInfo.imgUrl" alt="">
				<span>{{userInfo.nickName}}</span>
			</div>
			<div v-else class='login' @click='goLogin'>登录/注册</div>
    </Header>
    <section>
      <ul>
        <li class="iconfont icon-dizhi" @click="goPath">
          地址管理
        </li>
        <li class="iconfont icon-lishi-" @click="goorder">
          历史订单
        </li>
        <li class="iconfont icon-kefu" >
          我的客服
        </li>
        <li class="iconfont icon-gongkaiyijianxiang"  @click="goidea">
          意见箱
        </li>
        <li class="iconfont icon-tianjiayonghu" >
          加入我们
        </li>
        <li class="iconfont icon-wode" @click="gomyinfo">
          个人信息
        </li>
        <li class="iconfont icon-tuichudenglu" v-if='loginStatus' @click='loginOut'>退出登录</li>
      </ul>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
import {mapState,mapMutations} from 'vuex'
import Tabbar from '@/components/common/Tabbar.vue';
export default {
  name:'My',
  data () {
    return {
    }
  },
  components:{
    Tabbar
  },
  computed:{
	...mapState({
		loginStatus:state=>state.user.loginStatus,
		userInfo:state=>state.user.userInfo
	})
  },
  methods:{
    ...mapMutations(['loginOut']),
    goLogin() {
      this.$router.push('/login')
    },
    goPath() {
      this.$router.push('/path')
    },
    goorder() {
      this.$router.push('/ordernum')
    },
    gomyinfo() {
      this.$router.push('/myinfo')
    },
    goidea() {
      this.$router.push('/idea')
    }
  }

}
</script>

<style lang="less" scoped>
header{
  display: flex;
  justify-content: center;
  align-items: center;
  width:100%;
  height: 9.375rem;
  background-color: #b0352f;
  .login{
    padding: .375rem .9375rem;
    font-size: 1rem;
    color: #fff;
    background-color: #f6ab32;
    border-radius: .375rem;
  }
  .user-info{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		img{
			width: 50px;
			height:50px;
			border-radius: 50%;
		}
		span{
			padding:0.533333rem 0;
			font-size:15px;
			color:#fff;
		}
	}
}
section{
  flex: 1;
  overflow: hidden;
  ul{
    li{
      padding: 15px;
      font-size: 16px;
    }
  }
}
</style>
