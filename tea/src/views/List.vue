<template>
  <div class="list"> 
    <header v-show='isShow'>
      <div class="returns" @click="gohome">
        <i class="iconfont icon-fanhui"></i>
      </div>
      <div class="search">
        <i class="iconfont icon-fangdajing"></i>
        <span>搜您喜欢的...</span>
      </div>
      <div class="go-home">
        <i class="iconfont icon-shouye" @click="gohome"></i>
      </div>
    </header>
    <section>
      <div class="list-l" ref='left'>
        <ul class="l-item">
          <li
          v-for="(item,index) in leftData" :key="index"
          :class="{active:index==currentIndex}"
          @click="goScroll(index)"
          >{{item.name}}</li>
        </ul>
      </div>
        <div class="list-r" ref="right">
          <div>
            <ul v-for="(item,index) in rightData" :key="index" class="shop-height">
              <li class="shop-list" v-for="(k,i) in item" :key="i">
                <h2>{{k.name}}</h2>
                <ul class="r-content">
                  <li v-for="(p,b) in k.list" :key="b" @click="goodslist(p.id)">
                    <img :src="p.imgUrl" alt="">
                    <span>{{p.name}}</span>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
  import BetterScroll from 'better-scroll'
import Tabbar from '@/components/common/Tabbar.vue';
import http from '@/common/api/request'
export default {
  name:'List',
  data () {
    return {
      isShow:true,
      leftData:[],//左侧数据
		  rightData:[],//右侧数据
      rightBScroll:'',//右侧滑动BScroll
      allHeight:[],//承载右侧每一块的高度值
      scrollY:''//右侧滚动距离
    }
  },
  computed:{
		currentIndex(){
			return this.allHeight.findIndex((item, index)=>{
        // 滚动的距离大于等于
				return this.scrollY >= item && this.scrollY < this.allHeight[index+1]
			})
		}
  },
  components:{
    Tabbar
  },
  created() {
    this.getData()
  },
  methods:{
    async getData(){
      let res = await http.$axios({
        url:'/api/goods/shoplist'
      })
      // 用于存储重构的左边数据
      let leftArr = []
      let rightArr = []
      // 需要将各个一级目录提取出来渲染左侧界面，所有需要对请求回来的数据进行重新构造
      res.forEach(v=>{
        // 循环将一级目录的内容通过push添加到leftArr中
        leftArr.push({
          id:v.id,
          name:v.name
        })
        rightArr.push(v.data)
      })
      this.leftData = leftArr
      this.rightData = rightArr
      //统计右侧所有板块高度值，并且放入数组中
      this.$nextTick(()=>{
        //左侧滑动
        new BetterScroll(this.$refs.left,{
          click:true,
          bounce: false
        });
        //右侧滑动
        this.rightBScroll = new BetterScroll(this.$refs.right,{
          click:true,
          probeType:3,
          bounce: false
        });
        //统计右侧所有板块高度值，并且放入数组中
        let height = 0;
        this.allHeight.push(height);
        // 获取右侧每一块高度
        let uls = this.$refs.right.getElementsByClassName('shop-height');
        // 将dom对象转换成真正的数组
        Array.from(uls).forEach(v=>{
          height += v.clientHeight
          this.allHeight.push(height)
        })
        //得到右侧滚动的值
        this.rightBScroll.on('scroll',(pos)=>{
          this.scrollY = Math.abs( pos.y );
          if(Math.abs( pos.y ) >= 50  ){
            this.isShow = false;
          }else{
            this.isShow = true;
          }
        })
      })
    },
    goScroll(index) {
      // 利用scrollTo属性改变页面的位置
      this.rightBScroll.scrollTo(0,-this.allHeight[index],500);
    },
    gohome(){
      this.$router.push('/home')
    },
    goodslist(id){
      console.log(id);
    }
  }
}
</script>

<style lang="less" scoped>
.list{
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  header{
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 2.75rem;
    background-color: #b0352f;
    .returns{
      line-height: 2.75rem;
      padding: 0 .625rem;
      i{
        color: #fff;
        font-size: 1.25rem;
      }
    }
    .search{
        display: flex;
        align-items: center;
        background-color: #fff;
        flex: 1;
        padding: 0 1rem;
        border-radius: 12px;
        i{
          color: #666;
          padding: 0 10px 0 0;
          font-size: 20px;
        }
        span{
          color: #666;
          font-size: .9375rem;
        }
      }
    .go-home{
      padding: 0 10px;
      line-height: 2.75rem;
      i{
        font-size: 20px;
        color: #fff;
      }
    }
  }
}
section{
  // 设置分成左右两部分
  display: flex;
  flex: 1;
  overflow: hidden;
  margin-top: 10px;
  margin-bottom: 50px;
  .list-l{
    width: 6.25rem;
    background-color: #fff;
    border-right: 1px solid #ccc;
    // 溢出隐藏
    overflow: hidden;
    .l-item{
      display: flex;
      // 将子元素垂直显示
      flex-direction: column;
      // 居中
      justify-content: center;
      align-items: center;
      li{
        width: 100%;
        line-height: 1.875rem;
        text-align: center;
        font-size: 16px;
        padding: 15px 0;
        &.active{
          color: #b0352f;
          border-left: .375rem solid #b0352f;
        }
      }
    }
  }
  .list-r{
    flex: 1;
    overflow: hidden;
    div{
      // background-color: aqua;
      height: 300%;
    }
    .shop-list{
      text-align: center;
      h2{
        padding: 1.25rem 0;
        font-size: 20px;
        font-weight: 400;
      }
      .r-content{
        display: flex;
        flex-wrap: wrap;
        li{
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          width: 33.3%;
          padding: .625rem 0;
         img{
          width: 3.3125rem;
          height: 3.3125rem;

         }
         span{
          font-size: 10px;
         }
        }
      }
    }
  }
}
::v-deep.tabbar{
  border-top: 1px solid #ccc;
}
</style>
