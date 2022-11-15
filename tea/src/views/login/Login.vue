<template>
  <div class="login container">
    <Header></Header>
    <section>
      <div class="login-tel">
        <input type="text" v-model='userTel' placeholder="请输入手机号" pattern="[0-9]*">
      </div>
      <div class="login-code">
        <input type="text" placeholder="请输入短信验证码" pattern="[0-9]*" v-model="userCode">
        <button 
					:disabled="disabled"
					@click='sendCode'
				>{{codeMsg}}</button>
      </div>
      <div class="login-btn" @click='login'>登录</div>
      <div class="tab">
        <span class="iconfont icon-suo" @click="goUserLogin">密码登录</span>
        <span class="iconfont icon-shouji" @click="goRegister">快速注册</span>
      </div>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
import Tabbar from '@/components/common/Tabbar'
import Header from '@/views/login/Header.vue'
import { Toast } from 'mint-ui';
import http from '@/common/api/request.js'
import qs from 'qs'
import {mapMutations} from 'vuex'
export default {
  name:'login',
  data () {
    return {
			disabled:false,
			userTel:'',
			userCode:'',
			//验证规则
			rules:{//手机号验证
				userTel:{
					rule:/^1[23456789]\d{9}$/,
					msg:'手机号不能为空，并且是11位数字'
				}
			},
			codeNum:11,
			codeMsg:'获取短信验证码',
			code:''
		}
  },
  components:{
    Header,
    Tabbar
  },
  methods:{
		...mapMutations(['USER_LOGIN']),
		//点击获取短信验证码按钮
		sendCode(){
			//验证
			if( !this.validate('userTel') ) return;

			let data = qs.stringify({
        phone:this.userTel,
			})
				//请求短信验证码接口
			http.$axios({
				url:'/api/code',
				method:'POST',
				data:data
			}).then(res=>{
				if( res.success ){
					this.code = res.data;
				}
			})

			//禁用按钮
			this.disabled = true;
			//倒计时
			let timer = setInterval(()=>{
				--this.codeNum;
				this.codeMsg = `重新发送 ${this.codeNum}`;
			},1000)
			//判断什么时候停止定时器
			setTimeout(()=>{
				clearInterval( timer );
				this.codeNum = 11;
				this.disabled = false;
				this.codeMsg = '获取短信验证码';
			},11000)
			
		},
		goUserLogin(){
			this.$router.push('/userLogin');
		},
		goRegister(){
			this.$router.push('/register');
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
		},
		//点击登录
		login(){
			console.log('dianji');
			console.log(this.userCode);
			console.log(this.code);
			if( this.code  ==  this.userCode ){
				//证明用户输入的短信验证码是正确的
				//发送请求
				let data = qs.stringify({
					phone:this.userTel,
					})
				http.$axios({
					url:'/api/addUser',
					method:'POST',
					data:data
				}).then(res=>{
					if( !res.success ) return;
					//登录成功 ==》跳转页面，存储用户信息
					this.USER_LOGIN( res.data );
					// 跳转页面
					this.$router.push('/home')
				})
			}
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
		margin:10px 0;
		width: 20.9375rem;
		height: 2.75rem;
	}
  input{
		box-sizing: border-box;
		padding:0 0.266666rem;
		line-height: 44px;
		background-color: #FFFFFF;
		border:1px solid #ccc;
		border-radius: 6px;
	}
  .login-tel{
		margin-top:30px;
		input{
			width: 100%;
		}
	}
  .login-code{
		display: flex;
		input{
			flex:1;
		}
		button{
			padding:0 0.533333rem;
			line-height: 1.173333rem;
			color:#fff;
			background-color: #b0352f;
			border:0;
			border-radius: 6px;
      width: 40%;
      font-size: .9375rem;
		}
	}
	.login-btn{
		line-height: 44px;
    font-size: 20px;
		color:#fff;
		text-align: center;
		background-color: #b0352f;
		border-radius: 6px;
	}
	.tab{
		display: flex;
		justify-content: space-between;
		font-size: 15px;
	}
}
</style>
