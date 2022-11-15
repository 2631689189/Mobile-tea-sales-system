<template>
  <div class="recommend">
    <Cart>
      <!-- 插槽功能，在此处使用覆盖默认值 -->
      <!-- <span>
        露比推荐
      </span> -->
    </Cart>
    <ul>
			<li v-for='(item,index) in recommendList' :key='index' >
				<h2>
					<img :src="item.imgUrl" alt="">
				</h2>
				<div>
					<h3>{{item.name}}</h3>
					<p>{{item.content}}</p>
					<div class='price'>
						<span>¥</span>
						<b>{{item.price}}</b>
					</div>
				</div>
			</li>
		</ul>
  </div>
</template>

<script>
import Cart from '@/components/home/Cart.vue'
export default {
  name:'Recommend',
	props:{
		recommendList:Array
	},
  data () {
    return {

    }
  },
  components:{
    Cart
  }
}
</script>

<style lang="less" scoped>
.recommend ul li{
	position: relative;
  margin-bottom: .625rem;
}
.recommend ul li h2{
	text-align: center;
}
.recommend ul li img{
	width: 22.5rem;
  height: 9rem;
  border-radius: .75rem;
}
.recommend ul li > div{
	position: absolute;
	right:0;
	top:0;
	display: flex;
	flex-direction: column;
	padding: .625rem;
}
.recommend ul li > div h3{
	font-size: .75rem;
  text-align: right;
}
.recommend ul li > div p{
	font-size: 1rem;
}
.price{
	margin-top: 1.5625rem;
	text-align: right;
	color:#b0352f;
  b{
    font-size: 1.5625rem;
  }
}
.price span{
	font-size: 1.25rem;
}
.recommend{
  h1{
    text-align: center;
  }
  ul{
    padding: .625rem;
  }
}

</style>
