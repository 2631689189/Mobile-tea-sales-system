<template>
  <div class='path-index container'>
      <Header>
          <span>添加地址</span>
      </Header>
      <section>
          <van-address-edit
            :area-list="areaList"
            show-set-default
            :search-result="searchResult"
            @save="onSave"
          />
      </section>
      <Tabbar></Tabbar>
  </div>
</template>

<script>
import { Toast } from 'vant';
import http from '@/common/api/request.js'
import Header from '@/components/path/Header.vue'
import Tabbar from '@/components/common/Tabbar.vue'
import qs from 'qs'
export default{
  data() {
      return {
          areaList:{
              province_list: {
                110000: '北京市',
                120000: '天津市',
                130000: '河北省',
                140000: '山西省',
                150000: '内蒙古自治区',
                210000: '辽宁省',
                220000: '吉林省',
                230000: '黑龙江省',
                310000: '上海市',
                320000: '江苏省',
                330000: '浙江省',
                340000: '安徽省',
                350000: '福建省',
                360000: '江西省',
                370000: '山东省',
                410000: '河南省',
                420000: '湖北省',
                430000: '湖南省',
                440000: '广东省',
                450000: '广西壮族自治区',
                460000: '海南省',
                500000: '重庆市',
                510000: '四川省',
                520000: '贵州省',
                530000: '云南省',
                540000: '西藏自治区',
                610000: '陕西省',
                620000: '甘肃省',
                630000: '青海省',
                640000: '宁夏回族自治区',
                650000: '新疆维吾尔自治区',
                710000: '台湾省',
                810000: '香港特别行政区',
                820000: '澳门特别行政区',
                900000: '海外',
              },
              city_list: {
                110100: '北京市',
                120100: '天津市',
                130100: '石家庄市',
                130200: '唐山市',
                130300: '秦皇岛市',
                130400: '邯郸市',
                130500: '邢台市',
                130600: '保定市',
                130700: '张家口市',
                130800: '承德市',
                130900: '沧州市',
                131000: '廊坊市',
                131100: '衡水市',
                140100: '太原市',
                140200: '大同市',
                140300: '阳泉市',
                140400: '长治市',
                140500: '晋城市',
                140600: '朔州市',
                140700: '晋中市',
                140800: '运城市',
                140900: '忻州市',
                141000: '临汾市',
                141100: '吕梁市',
                150100: '呼和浩特市',
                150200: '包头市',
                150300: '乌海市',
                150400: '赤峰市',
                150500: '通辽市',
                150600: '鄂尔多斯市',
                150700: '呼伦贝尔市',
                150800: '巴彦淖尔市',
                150900: '乌兰察布市',
                152200: '兴安盟',
                152500: '锡林郭勒盟',
                152900: '阿拉善盟',
                210100: '沈阳市',
                210200: '大连市',
                210300: '鞍山市',
                210400: '抚顺市',
                210500: '本溪市',
                210600: '丹东市',
                210700: '锦州市',
                210800: '营口市',
                210900: '阜新市',
                211000: '辽阳市',
                211100: '盘锦市',
                211200: '铁岭市',
                211300: '朝阳市',
                211400: '葫芦岛市',
                220100: '长春市',
                220200: '吉林市',
                220300: '四平市',
                220400: '辽源市',
                220500: '通化市',
                220600: '白山市',
                220700: '松原市',
                220800: '白城市',
                222400: '延边朝鲜族自治州',
                230100: '哈尔滨市',
                230200: '齐齐哈尔市',
                230300: '鸡西市',
                230400: '鹤岗市',
                230500: '双鸭山市',
                230600: '大庆市',
                230700: '伊春市',
                230800: '佳木斯市',
                230900: '七台河市',
                231000: '牡丹江市',
                231100: '黑河市',
                231200: '绥化市',
                232700: '大兴安岭地区',
                310100: '上海市',
                320100: '南京市',
                320200: '无锡市',
                320300: '徐州市',
                320400: '常州市',
                320500: '苏州市',
                320600: '南通市',
                320700: '连云港市',
                320800: '淮安市',
                320900: '盐城市',
                321000: '扬州市',
                321100: '镇江市',
                321200: '泰州市',
                321300: '宿迁市',
                330100: '杭州市',
                330200: '宁波市',
                330300: '温州市',
                330400: '嘉兴市',
                330500: '湖州市',
                330600: '绍兴市',
                330700: '金华市',
                330800: '衢州市',
                330900: '舟山市',
                331000: '台州市',
                331100: '丽水市',
                340100: '合肥市',
                340200: '芜湖市',
                340300: '蚌埠市',
                340400: '淮南市',
                340500: '马鞍山市',
                340600: '淮北市',
                340700: '铜陵市',
                340800: '安庆市',
                341000: '黄山市',
                341100: '滁州市',
                341200: '阜阳市',
                341300: '宿州市',
                341500: '六安市',
                341600: '亳州市',
                341700: '池州市',
                341800: '宣城市',
                350100: '福州市',
                350200: '厦门市',
                350300: '莆田市',
                350400: '三明市',
                350500: '泉州市',
                350600: '漳州市',
                350700: '南平市',
                350800: '龙岩市',
                350900: '宁德市',
                360100: '南昌市',
                360200: '景德镇市',
                360300: '萍乡市',
                360400: '九江市',
                360500: '新余市',
                360600: '鹰潭市',
                360700: '赣州市',
                360800: '吉安市',
                360900: '宜春市',
                361000: '抚州市',
                361100: '上饶市',
                370100: '济南市',
                370200: '青岛市',
                370300: '淄博市',
                370400: '枣庄市',
                370500: '东营市',
                370600: '烟台市',
                370700: '潍坊市',
                370800: '济宁市',
                370900: '泰安市',
                371000: '威海市',
                371100: '日照市',
                371300: '临沂市',
                371400: '德州市',
                371500: '聊城市',
                371600: '滨州市',
                371700: '菏泽市',
                410100: '郑州市',
                410200: '开封市',
                410300: '洛阳市',
                410400: '平顶山市',
                410500: '安阳市',
                410600: '鹤壁市',
                410700: '新乡市',
                410800: '焦作市',
                410900: '濮阳市',
                411000: '许昌市',
                411100: '漯河市',
                411200: '三门峡市',
                411300: '南阳市',
                411400: '商丘市',
              },
              county_list: {
                110101: '东城区',
                110102: '西城区',
                110105: '朝阳区',
                110106: '丰台区',
                110107: '石景山区',
                110108: '海淀区',
                110109: '门头沟区',
                120101: '和平区',
                120102: '河东区',
                120103: '河西区',
                120104: '南开区',
                120105: '河北区',
                120106: '红桥区',
                120110: '东丽区',
                120111: '西青区',
                120112: '津南区',
                120113: '北辰区',
                131122: '武邑县',
                131123: '武强县',
                131124: '饶阳县',
                131125: '安平县',
                131126: '故城县',
                131127: '景县',
                131128: '阜城县',
                131182: '深州市',
                140105: '小店区',
                140106: '迎泽区',
                140107: '杏花岭区',
                140108: '尖草坪区',
                140109: '万柏林区',
                140110: '晋源区',
                140121: '清徐县',
                140122: '阳曲县'
            },
          },
          searchResult: [],
      };
  },
  components:{
      Header,
      Tabbar
  },
  methods: {
        //点击保存触发
        onSave( content ) {
           content.isDefault = content.isDefault==true ? 1 : 0;
          // let contents = JSON.stringify(content)
          let data = qs.stringify(content)
          console.log(data);
            http.$axios({
            	url:'/api/addAddress',
                method:"post",
                headers:{
                  token:true
                },
                data:data
                
            }).then(res=>{
                if( !res.success ) return;
                Toast(res.msg);
                this.$router.push('/path');
                // console.log(res);
                // Toast('save')
            })
            
        }
    },
}
</script>

<style lang='less' scoped>
section{
  background-color: #F7F7F7;
  .van-address-edit{
      padding: 0;
  }
  ::v-deep .van-address-edit__buttons{
      display: flex;
      justify-content: center;
      align-items:center;
  }
  ::v-deep .van-button--danger{
      width: 15rem;
      height: 2.066666rem;
      background-color: #b0352f;
  }
}
::v-deep .tabbar{
  border-top:2px solid #ccc;
}
</style>
