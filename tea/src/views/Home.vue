<template>
  <div class="home">
    <div class="headers">
      <div class="headers-main">
        <Header></Header>
        <ly-tab 
          class="ly-tab"
          v-model="selectedId"
          :items="items"
          :options="options"
          @change="ChangeTab">
        </ly-tab>
      </div>
    </div>
    <section ref="wrapper">
      <div>
        <div v-for="(item, index) in newData" :key="index">
          <Swiper v-if='item.type == "swiperList"'
          :swiperList1 = 'item.data'
          ></Swiper>

          <Icons 
					v-if='item.type=="iconsList"'
					:iconsList='item.data'
				  ></Icons>

          <Recommend 
					v-if='item.type=="recommendList"'
					:recommendList='item.data'
				  ></Recommend>

          <Poster 
					v-if='item.type=="adList"'
					:adList='item.data'
				  ></Poster>

          <Like 
					v-if='item.type=="likeList"'
					:likeList='item.data'
				  ></Like>
          
        </div>
      </div>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
  import Swiper from '@/components/home/Swiper.vue'
  import Header from '@/components/home/Header'
  import Icons from '@/components/home/Icons.vue'
  import Recommend from '@/components/home/Recommend'
  import Like from  '@/components/home/Like.vue'
  import Poster from '@/components/home/Poster.vue'
  import Tabbar from '@/components/common/Tabbar'
  // 引入滚动插件
  import BetterScroll from 'better-scroll'
  // axios的二次封装
  import http from '@/common/api/request'
export default {
  name:'Home',
  data() {
    return  {
      selectedId: 0,
		  items: [],
      newData:[],
      oBetterScroll:'',
		  tBetterScroll:'',
      options: {
        activeColor: '#b0352f'
      }
    }
  },
  components:{
    Header,
    Icons,
    Recommend,
    Swiper,
    Like,
    Poster,
    Tabbar
  },
  // 接口请求
  created() {
    this.getData()
    // this.getPost()
  },
  // 请求数据事件处理器
  methods:{
    async getData() {

      let res = await http.$axios({
        url:'/api/index_list/0/data/1'
      })
      this.items = Object.freeze(res.topBar[0])
      this.newData = Object.freeze(res.data);
      // console.log(this.newData);

      // 当dom都加载完毕了再去执行
      this.$nextTick(()=>{
        this.oBetterScroll = new BetterScroll(this.$refs.wrapper, {
          movable: true,
          zoom: true,
          click:true
        })
      })
    },
    async addData(index){
      let res = await http.$axios({
        url:'/api/index_list/'+index+'/data/1'
      })
      // 判断路径
      if(  res.constructor !=Array ){
			  this.newData = res.data;
		  }else{
			  this.newData = res;
		  }

    this.$nextTick(()=>{
			this.tBetterScroll = new BetterScroll(this.$refs.wrapper, {
			  movable: true,
			  zoom: true
			})
		})

    },
    ChangeTab(item,index) {
      this.addData(index);
    },
    // async getPost(){
    // let res = await http.$axios({
    //     url:'/api/reddis',
    //     methods:'get'
    //   })
    //   console.log(res);
    // }

  }
  
}
</script>

<style lang="less" scoped>
  .home{
    display: flex;
    flex-direction: column;
    // width: 100vw;
    // height: 100vh;
    overflow: hidden;
  }
  .headers{
    width: 100%;
    height: 6rem;
  }
  .headers-main{
    position: fixed;
    top: 0;
    left: 0;
    z-index: 998;
    width:100%;
    background-color: white;
  }
  section{
    flex: 1;
    overflow: hidden;
    margin-bottom: 40px;
  }
  ::v-deep .ly-tabbar{
    box-shadow:none;
    border-bottom: none;
  }
</style>
