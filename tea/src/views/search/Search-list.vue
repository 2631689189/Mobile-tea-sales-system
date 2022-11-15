<template>
  <div class="search-list">
    <div class="headers">
      <Header></Header>
      <ul>
        <li v-for='(item,index) in searchList.data' :key='index'
					@click='changeTab(index)'>
          <div :class=' searchList.currentIndex == index ?"active":"" '
          > {{item.name}}
          </div>
					<div class='search-filter' v-if='index !=0 '>
						<i 
							class='iconfont icon-xiangshang1'
							:class=' item.status == 1 ? "active" : ""'
						></i>
						<i 
							class='iconfont icon-xiangxia1'
							:class=' item.status == 2 ? "active" : ""'
						></i>
					</div>
        </li>
      </ul>
    </div>
    <section>
      <div :style="{'max-height': this.timeLineHeight + 'px' }"
      style="overflow-y:scroll;">
        <ul v-if="goodsList != ''">
          <!-- <ul> -->
          <li v-for="(item,index) in goodsList" :key="index">
            <img v-lazy='item.imgUrl' alt="" @click="godetail(item.id)">
            <h3>{{item.name}}</h3>
            <div class='price'>
              <div>
                <span>￥</span>
                <b>{{item.price}}</b>
              </div>
              <div>立即购买</div>
            </div>
          </li>
        </ul>
        <h1 v-else >暂无相关商品的数据，请换其它的关键字再试试...</h1>
      </div>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
import Header from '@/components/search/Header.vue'
import Tabbar from '@/components/common/Tabbar.vue'
import http from '@/common/api/request'
export default {
  name:'Search-list',
  data () {
    return {
      timeLineHeight: "",
      goodsList:[],
      searchList:{
        currentIndex:0,
        data:[
          /*
					status:0 都不亮
					status:1 上箭头亮
					status:2 下箭头亮
					*/
					{name:'综合',key:'zh'},
					{name:'价格',status:0,key:'price'},
					{name:'销量',status:0,key:'numbe'}
        ]
      }
    }
  },
  computed:{
    orderBy(){
      // 获取用户当前点击的是升序还是降序
      let obj = this.searchList.data[this.searchList.currentIndex]
      // 如果用户点击的obj值为1则表示升序否则为降序
      let val = obj.status == '1' ? 'asc' : 'desc';
      // --->obj.key表示价格还是销量，val表示升序还是降序----->price:asc
      return{
        [obj.key]:val
      }
    }
  },
  components:{
    Header,
    Tabbar
  },
  mounted() {
    this.timeLineHeight = document.documentElement.clientHeight - 170;
    window.onresize = () => {
      this.timeLineHeight = document.documentElement.clientHeight - 100;
    };
  },
  created() {
    this.getData()
  },
  methods:{
    async getData() {
      await http.$axios({
        url:'/api/goods/qerylist',
        // 传递的数据
        params:{
          // ...this.orderBy表示price:asc这类的值
          searchName:this.$route.query.key, ...this.orderBy
        },
      }).then(res=>{
        this.goodsList = res
        // console.log(this.goodsList);
      })
    },
    godetail(id){
      this.$router.push({
        path:'/detail',
				query:{
					id
				}
      })
    },
    // 改变状态事件
    changeTab( index ){
			this.searchList.currentIndex = index;
			//点击的下标对应数据的哪一个
			let item = this.searchList.data[index];
			//取消所有的状态值===》都变成0
			this.searchList.data.forEach((v,i)=>{
				if( i != index ){
					v.status = 0;
				}
			})
			//当前点击的改变状态
			if(  index == this.searchList.currentIndex ){
				item.status = item.status == 1 ? 2 : 1;
			}
			//发送请求进行数据排序
			this.getData();
		}
  },
  // 使用watch监听路由的变化，如果发生变化则再发起请求一次
  watch:{
    $route() {
      this.getData()
    }
  }
}
</script>

<style lang="less" scoped>
.search-list{
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  .headers{
    ul{
      display: flex;
      justify-content: space-around;
      padding: .9375rem 0;
      font-size: 1.25rem;
      li{
        display: flex;
        align-items: center;
        .search-filter{
          margin-left: 6px;
          display: flex;
          // 上下排列
          flex-direction: column;
          font-size: 5px;
        }
      }
    }
  }
  section{
    ul{
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      li{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        // 设置盒子不撑开
        box-sizing: border-box;
        width: 50%;
        padding: .625rem;
        img{
          width: 10.625rem;
          height: 10.625rem;
        }
        img[lazy=loading] {
          background-color: #f7f7ff;
        }
        h3{
          width: 100%;
          // 设置超过边界直接省略
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
          font-weight: 400;
          padding: 10px 0;
        }
        .price{
          display: flex;
          justify-content: space-between;
          width: 100%;
        }
      }
    }
  }
  section ul li .price div:first-child span{
    color: #b0352f;
    font-size: 10px;
  }
  section ul li .price div:first-child b{
    color: #b0352f;
    font-size: 15px;
  }
  section ul li .price div:last-child{
    background-color: #b0352f;
    color: #fff;
    padding: 4px 6px;
    border-radius: 6px;
  }
}
.active{
  color: #b0352f;
}
</style>
