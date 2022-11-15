<template>
  <div class="swiper">
    <swiper :options="swiperOption">
		  <swiper-slide 
			v-for='(item,index) in swiperList1' :key='index' >
			<img :src="item.imgUrl" alt="">
		  </swiper-slide>
		</swiper>
    <div class="swiper-pagination"></div> 
  </div>
</template>

<script>
import 'swiper/dist/css/swiper.css'
import {swiper,swiperSlide} from 'vue-awesome-swiper'

export default {
  name:'Swiper',
  // 接收home传递的swiper数据
  props:{
    swiperList1:Array
  },
  data () {
    return {
		swiperOption: {//swiper3
			autoplay: 3000,
			speed: 1000,
			pagination: {
				el: '.swiper-pagination'
			}
		}
    }
  },
  components:{
    swiper,
    swiperSlide
  }
}
</script>

<style lang="less" scoped>
  .swiper{
    // 定位
    position: relative;
    // margin-top: 6rem;
    margin-top: 0;
    width: 100%;
    height: 10.3125rem;
    img{
      width: 100%;
      height: 10.3125rem;
    }
    .swiper-pagination{
      width: 100%;
      bottom: 0;
    }
    ::v-deep .swiper-pagination-bullet-active{
      background-color: #b0352f;
    }
    ::v-deep .swiper-pagination-bullet{
      margin:0 3px;
    }
  }
</style>
