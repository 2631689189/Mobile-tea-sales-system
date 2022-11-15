<template>
	<div class='detail'>
		<header>
			<div class='header-returns' v-show='isShow'>
				<div @click='goBack()'>
					<i class='iconfont icon-fanhui'></i>
				</div>
				<div>
					<i class='iconfont icon-kefu'></i>
				</div>
			</div>
			
			<div 
				class='header-bar' 
				v-show='!isShow'
				:style='styleOption'
			>
				<div @click='goBack'>
					<i class='iconfont icon-fanhui'></i>
				</div>
				<div>
					<span>商品详情</span>
				</div>
				<div>
					<i class='iconfont icon-kefu'></i>
				</div>
			</div>
		</header>
		<section ref='wrapper'>
			<div>
				<div class='swiper-main'>
					<swiper :options="swiperOption">
					  <swiper-slide 
						v-for='(item,index) in swiperList' 
						:key='index'
					   >
						<img :src="item.imgUrl" alt="">
					  </swiper-slide>
					</swiper>
					<div class="swiper-pagination"></div> 
				</div>
				<div class='goods-name'>
					<h1>{{goods.name}}</h1>
					<div>{{goods.letter}}</div>
				</div>
				<div class='goods-price'>
					<div class='oprice'>
						<span>¥</span>
						<b>{{goods.price}}</b>
					</div>
					<div class='pprice'>
						<span>价格:</span>
						<del>¥{{goods.price}}</del>
					</div>
				</div>
				<div>
					<img style='width:100%; height: 500px;' :src="goods.imgUrl">
					<!-- <img style='width:100%;height: 500px;' :src="goods.imgUrl" alt=""> -->
				</div>
			</div>
		</section>
		<footer>
			<div class='add-cart' @click='addCart'>加入购物车</div>
			<div>立即购买</div>
		</footer>
	</div>
</template>

<script>
import 'swiper/dist/css/swiper.css'
import { swiper, swiperSlide } from 'vue-awesome-swiper'
import BetterScroll from 'better-scroll'
import http from '@/common/api/request.js'
import qs from 'qs'
import { Toast } from 'vant'
// import axios from 'axios'; 
import httpp from '@/common/api/detailapi'
export default{
	data(){
	  return{
			times:null,
			id:0,
			goods:{},
			styleOption:{},
			BetterScroll:'',
		  isShow:true,
			swiperOption: {
				autoplay: 3000,
				speed: 1000,
				pagination: {
					el: '.swiper-pagination',
					type:'fraction'
				}
			},
			swiperList:[
				{
					imgUrl:'./images/goods-list.png'
				},
				{
					imgUrl:'./images/goods2.jpg'
				},
				{
					imgUrl:'./images/goods3.jpg'
				}
			]
	  }
	},
	components: {
	  swiper,
	  swiperSlide
	},
	created(){
		// 接收路径传参的商品id值
		this.id = this.$route.query.id;
		// console.log('------');
		this.identifier = this.$route.query.identifier
		// console.log('====',this.identifier);
		this.getData();
		// 设置轮询请求
		// 实现轮询
	},
	// 页面加载完毕
	mounted(){
		this.BetterScroll = new BetterScroll(this.$refs.wrapper, {
			probeType: 3,
			bounce: false,
			click:true
		})
		this.BetterScroll.on('scroll',(pos)=>{
			let posY = Math.abs( pos.y );
			let opacity = posY / 180;
			
			opacity = opacity > 1 ? 1 : opacity;
			
			this.styleOption = {
				opacity:opacity
			}
				
			if( posY >= 50 ){
				this.isShow = false;
			}else{
				this.isShow = true;
			}
		})
		
	},
	activated(){
		
		//判断当前url , id和之前id是否一致
		if(  this.$route.query.id != this.id ){
			this.getData();
			this.id = this.$route.query.id;
		}
		
	},
	methods:{
		// 查询数据
		async getData(){
			let id = this.$route.query.id;
			let res = await http.$axios({
				url:'/api/goods/id',
				headers:{
					token:true
				},
				params:{
					id
				}
			})
			this.goods = res;
			// 获取数据启动定时器
			window.clearInterval(this.timer)
			this.setTimer()
			// console.log(this.goods);

		},
		//加入购物车
		addCart(){
			// console.log('----------',this.$route.query.identifier);
			let postData = qs.stringify({
				goodsId:this.$route.query.id,
				identifier:this.$route.query.identifier
				})
				console.log('--',postData);
				http.$axios({
						url:'/api/addCart',
						method:"post",
						data:postData,
						headers:{
								token:true
						}
				}).then(res=>{
						if(res.success){
							Toast('添加购物车成功')
						}
				})
		},
		goBack(){
			this.$router.go(-1),
			clearInterval(this.timer)
			this.timer
		},
		setTimer:function() {
			this.timer = setInterval(() =>{
				let data = qs.stringify({
					id:this.id
				})
				httpp.$axios({
					url:'/api/propelling',
					method:"post",
					headers:{
						token:true
					},
					data:data
      	})
			},3000)},
	}
}
</script>

<style scoped lang="less">
.detail{
	display: flex;
	flex-direction: column;
	width: 100vw;
	height: 100vh;
	overflow: hidden;
}
header{
	position:fixed;
	left:0;
	top:0;
	z-index: 999;
	width: 100%;
	height: 2.173333rem;
	.header-returns{
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 100%;
		height: 2.173333rem;
		div{
			margin:0 0.466666rem;
			width: 2.173333rem;
			line-height: 1.906666rem;
			text-align: center;
			background-color: rgba(0,0,0,0.3);
			border-radius: 50%;
		}
		i{
			font-size:1.693333rem;
			color:#fff;
		}
	}
	.header-bar{
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 100%;
		height: 1.173333rem;
		font-size:0.826666rem;
		background-color: #fff;
		span{
			padding:0 0.266666rem;
		}
		i{
			padding:0 0.266666rem;
			font-size:0.586666rem;
		}
	}
}
section{
	flex:1;
	overflow: hidden;
}
.swiper-main{
	position: relative;
	width: 100%;
	height:20rem;
	overflow: hidden;
}
.swiper-container{
	width: 100%;
	height: 20rem;
}
.swiper-container img{
	width: 100%;
	height: 20rem;
}
.swiper-pagination{
	bottom:0.266666rem;
	width: 100%;
	text-align: right;
	color:#FFFFFF;
	font-size:1rem;
}
.swiper-pagination-fraction, .swiper-pagination-custom, .swiper-container-horizontal > .swiper-pagination-bullets{
	left:-0.533333rem;
}
.goods-name{
	padding:0.533333rem 0.266666rem;
	border-bottom:1px solid #CCCCCC;
	h1{
		font-size:0.533333rem;
		font-weight: 500;
	}
	div{
		padding:0.08rem 0;
		font-size:0.373333rem;
		color: #999999;
	}
}
.goods-price{
	padding:0.533333rem 0.266666rem;
	.oprice{
		color:red;
		span{
			font-size:0.6rem;
		}
	}
	.pprice{
		color:#999999;
		font-size:0.673333rem;
	}
}
footer{
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	bottom:0;
	left: 0;
	width: 100%;
	height: 2.306666rem;
	border-top:1px solid #cccccc;
	background-color: #fff;
	div{
		width: 50%;
		line-height: 2.306666rem;
		font-size: 0.826666rem;
		text-align: center;
		color:#fff;
		background-color: red;
		&.add-cart{
			background-color: #FF9500;
		}
	}
	
}
</style>
