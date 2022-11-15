<template>
  <div class='path-index container'>
      <Header></Header>
      <section>
          <ul v-if='list.length' >
              <li 
                  v-for='(item,index) in list'
                  :key='index'
              >
             
                  <div>
                      <span>{{item.name}}</span>
                      <span>{{item.tel}}</span>
                  </div>
                  <div class='city' @click='goList'>
                      <span class='active' v-if='item.isDefault == 1'>[默认]</span>
                      <span>{{item.province}}</span>
                      <span>{{item.city}}</span>
                      <span>{{item.county}}</span>
                      <span>{{item.addressDetail}}</span>
                  </div>
                  <i class="iconfont icon-shanchu" @click="deleteAddress(item)"></i>
              </li>
          </ul>
          <h1 v-else>暂无数据，请添加地址</h1>
          <div class='add-path' @click='goList'>添加地址</div>
      </section>
      <Tabbar></Tabbar>
  </div>
</template>

<script>
import http from '@/common/api/request.js'
import Header from '@/components/path/Header.vue'
import Tabbar from '@/components/common/Tabbar.vue'
import {mapState,mapMutations} from 'vuex'
import bus from '@/common/bus.js'
// import { MessageBox } from 'mint-ui';
import qs from 'qs'
export default{
    data () {
        return {
            pathStatus:false
        }
    },
  components:{
      Header,
      Tabbar
  },
  created(){
    //从订单页面进来的
    if( this.$route.query.type == 'select' ){
        this.pathStatus = true;
    }

      this.getData();
  },
  computed:{
    ...mapState({
        list:state=>state.path.list
    })  
  },
  methods:{
      ...mapMutations(['initData']),
      getData(){
          http.$axios({
            url:'/api/selectAddress',
              method:"get",
              headers:{
                  token:true
              }
          }).then(res=>{
              this.initData( res.data );
              // console.log(res);
          })
      },
      goList(option){
          //this.pathStatus为true代表从订单页面进入的：选择状态
          if( this.pathStatus ){
                bus.$emit('selectPath', JSON.stringify(option) );
                this.$router.back();
                return;
            }
            this.$router.push({
                path:'/pathlist',
                params:{
                    key:JSON.stringify(option)
                }
            })
      },
    //   删除地址
      deleteAddress(item) {
        // MessageBox({
        // title: '提示',
        // message: '确定执行删除操作?',
        // showCancelButton: true
        // });
        // console.log('dd');
        let postData = qs.stringify({
            id:item.id
		})
        // console.log(postData);
        http.$axios({
            	url:'/api/deleteAddress',
                method:"post",
                headers:{
                    token:true
                },
                data:postData
            }).then(res=>{
                if( !res.success ) return;
                Toast(res.msg);
                this.$router.push('/path');
            })
        this.$router.go('/pathlist')
      },
  }
}
</script>

<style lang='less' scoped>
section{
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #F7F7F7;
  ul{
    width: 100%;
    li{
      padding:0.566666rem 0.9rem;
      margin:0.66rem 0;
      background-color: #FFFFFF;
      span{
          padding-right:1.1rem;
          font-size:0.926666rem;
      }
      .active{
          color:#b0352f;
      }
    }
  }
  .add-path{
      margin-top:.6rem;
      width: 5.2rem;
      line-height: 2.066666rem;
      font-size:1rem;
      text-align: center;
      color:#FFFFFF;
      background-color: #b0352f;
      border-radius: 6px;
  }
}
::v-deep .tabbar{
  border-top:2px solid #ccc;
}
</style>
