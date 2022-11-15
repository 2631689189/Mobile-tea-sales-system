<template>
  <div>
    <ul class="icons">
		<li v-for='(item,index) in iconsList' :key='index'>
			<img :src="item.imgUrl" alt="">
			<span>{{item.title}}</span>
		</li>
	</ul>
  </div>
</template>

<script>

export default {
  name:'Icons',
	props:{
		iconsList:Array
	},
  data () {
    return {
      
    }
  },
}
</script>

<style lang="less" scoped>
.icons{
	display: flex;
	justify-content: space-around;
	padding:.625rem 0;
}
.icons li{
	display: flex;
	flex-direction: column;
	align-items: center;
}
.icons img{
	width: 2.375rem;
	height: 2.375rem;

}
.icons span{
	padding:.375rem 0;
	font-size:.625rem;
}
</style>
