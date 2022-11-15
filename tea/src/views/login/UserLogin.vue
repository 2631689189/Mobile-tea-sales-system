<template>
  <div class="login container">
    <Header></Header>
		<section>
			<div class='login-tel'>
				<input type="text" v-model='userTel' placeholder="请输入手机号" pattern="[0-9]*">
			</div>
			<div class='login-tel'>
				<input type="password" v-model='userPwd' placeholder="请输入密码">
			</div>
			<div class='login-btn' @click='login'>登 录</div>
			<div class='tab'>
				<!-- <span @click='goLogin' class="iconfont icon-suo">短信登录</span> -->
				<span class="iconfont icon-suo" @click="gologin">密码登录</span>
				<span class="iconfont icon-shouji" @click="goRegister">快速注册</span>
			</div>
		</section>
		<Tabbar></Tabbar>
  </div>
</template>

<script>
import Tabbar from '@/components/common/Tabbar.vue'
import Header from './Header'
import { Toast } from 'mint-ui';
import http from '@/common/api/request.js'
import qs from 'qs'
import {mapMutations} from 'vuex'
export default {
	name:'UserLogin',
  data () {
		return {
			userTel:'',//用户输入的手机号
			userPwd:'',//用户输入的密码
			//验证规则
			rules:{
				//手机号验证
				userTel:{
					rule:/^1[23456789]\d{9}$/,
					msg:'手机号不能为空，并且是11位数字'
				},
				//密码验证
				userPwd:{
					rule:/^\w{6,12}$/,
					msg:'密码不能为空，并且要求6,12位'
				}
			}
		}
  },
  components:{
		Header,
		Tabbar
	},
	methods:{
		...mapMutations(['USER_LOGIN']),
		//点击登录按钮
		login(){
			//前端验证
			if( !this.validate('userTel') ) return;
			if( !this.validate('userPwd') ) return;
			//发送请求，后端验证
			let postData = qs.stringify({
        userPwd:this.userPwd,
				userTel:this.userTel
				})
			http.$axios({
				url:'/api/login',
				method:'post',
				data:postData
			}).then(res=>{
				//提示信息
				Toast(res.msg);
				//登录失败
				if( !res.success ) return;
				
				//登录成功 ==》跳转页面，存储用户信息
				this.USER_LOGIN( res.data );
				this.$router.push('/my')
				
			})
		},
		// goLogin(){
		// 	this.$router.push('/login');
		// },
			//注册
		goRegister(){
			this.$router.push('/register');
		},
		gologin(){
			this.$router.push('/login')
		},
		//验证信息提示
		validate( key ){
			let bool = true;
			if( !this.rules[key].rule.test( this[key])  ){
				//提示信息
				Toast(this.rules[key].msg);
				bool = false;
				return false;
			}
			return bool;
		}
	}
}
</script>

<style lang="less" scoped>
section{
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color:#f5f5f5;
	div{
		margin:.625rem 0;
		width: 20.625rem;
		height: 2.75rem;
	}
	input{
		box-sizing: border-box;
		padding:0 0.8rem;
		line-height: 2.75rem;
		background-color: #FFFFFF;
		border:1px solid #ccc;
		border-radius: 6px;
		font-size: .9375rem;
	}
	.login-tel{
		margin-top:1.5rem;
		input{
			margin: 20px 0;
			width:20.625rem;
		}
	}
	.login-btn{
		line-height: 44px;
		color:#fff;
		text-align: center;
		background-color: #b0352f;
		border-radius: 6px;
		font-size: 18px;
	}
	.tab{
		display: flex;
		justify-content: space-between;
		font-size:15px;
	}
}
div:nth-child(2){
	margin-bottom: 40px;
}
</style>
