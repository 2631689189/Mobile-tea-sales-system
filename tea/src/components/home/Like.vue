<template>
  <div class="like">
    <Cart>
      <!-- 插槽功能，在此处使用覆盖默认值 -->
      <span>
        商品列表
      </span>
    </Cart>
    <ul>
			<li v-for='(item,index) in likeList' :key='index' @click="goDetail(item)">
				<h2>
					<img v-lazy="item.imgUrl" alt="">
				</h2>
				<h3>{{item.name}}</h3>
				<div>
					<span>¥</span>
					<b>{{item.price}}</b>
				</div>
			</li>
		</ul>
  </div>
</template>

<script>
// mint-ui图片懒加载插件 
import Cart from '@/components/home/Cart.vue'
export default {
  naem:'Like',
  props:{
    likeList:Array
  },
  data () {
    return {
      
    }
  },
  components:{
    Cart
  },
  methods:{
    goDetail(item){
      // console.log('--');
      let id = item.id
      let identifier = item.identifier
      this.$router.push({
        path:'/detail',
				query:{
					id,
          identifier
				}
      })
    }
  }
}
</script>

<style lang="less" scoped>
.like{
  ul{
    display: flex;
    // 将盒子按宽度排列，当父盒子宽度不足时，换行
    flex-wrap: wrap;
    li{
      display: flex;
      // 将属性竖直排列
      flex-direction: column;
      // 在父盒中居中显示
      justify-content: center;
      align-items: center;
      width: 50%;
      h2{
        img{
          width: 11rem;
          height: 11rem;
        }
        img[lazy=loading] {
          background-color: #f7f7ff;
        }
      }
      h3{
        width: 100%;
        font-size: 14px;
        padding: .375rem;
        margin-left: .625rem;
        color: #222;
        font-weight: 400;
        // 指定如果内容溢出一个元素的框，会发生什么。
        overflow: hidden;
        // 指定当文本溢出包含它的元素时，应该如何显示
        text-overflow: ellipsis;
        // 设置不换行
        white-space: nowrap;
      }
      div{
        width: 93%;
        text-align: left;
        padding: 0 .375rem .625rem .375rem;
        color: #b0352f;
        span{
          font-size: 1rem;
        }
        b{
          font-size: 1.2rem;

        }
      }
    }
  }
}
</style>
