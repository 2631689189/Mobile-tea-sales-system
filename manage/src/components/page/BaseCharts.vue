<template>
  <div>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div>
        <div id="echarts" style="width: 600px;height:400px;"></div>
        <input type="button" @click="mcharts" value="柱形图" style="margin-bottom:20px">
        <div id="echartsline" style="width: 600px;height:400px;"></div>
        <input type="button" @click="mchartsline" value="折线图" style="margin-bottom:20px">
        <div id="mchartsround" style="width: 600px;height:400px;"></div>
        <input type="button" @click="mchartsround" value="饼图">
    </div>
  </div>
</template>

<script>

// <!-- 引入 echarts -->
    import * as echarts from 'echarts';
    import { echartslist } from '../../api/index';
    export default {
        name: "echarts",
        methods:{
            mcharts(){
                echartslist().then(res => {
                    this.table1 = res.data[0].sumbe;
                    this.table2 = res.data[1].sumbe;
                    this.table3 = res.data[2].sumbe;
                    this.table4 = res.data[3].sumbe;
                    this.table5 = res.data[4].sumbe;
                    this.table6 = res.data[5].sumbe;
                    this.table7 = res.data[6].sumbe;
                    // console.log(this.table1);
                })
            	// <!-- 基于准备好的dom，初始化echarts实例 -->
                const myChart = echarts.init(document.getElementById('echarts'));
                // <!-- 指定图表的配置项和数据 -->
                const option = {
                    title: {
                        text: '茶叶点击柱形图'
                    },
                    tooltip: {},
                    xAxis: {    //  x轴的下标
                        data: ["白茶", "金骏眉", "春茶", "滇茶", "铁观音", "大红袍",'普洱']
                    },
                    yAxis: {    //  y轴
                        type: 'value'
                    },
                    series: [{   //  y轴的数据
                        name: '点击量',
                        type: 'bar',    //  bar为柱状图，line为折线图，pie为饼图
                        data: [ 
                            {
                                value:this.table1,
                                itemStyle: {
                                    color: '#FF1493'
                                }
                            }, 
                            {
                                value:this.table2,
                                itemStyle: {
                                    color: '#DA70D6'
                                }
                            }, 
                            {
                                value:this.table3,
                                itemStyle: {
                                    color: 	'#800080'
                                }
                            }, 
                            {
                                value:this.table4,
                                itemStyle: {
                                    color: '#1E90FF'
                                }
                            }, 
                            {
                                value:this.table5,
                                itemStyle: {
                                    color: '#00FA9A'
                                }
                            }, 
                            {
                                value:this.table6,
                                itemStyle: {
                                    color: '#FFA500'
                                }
                            }, 
                            {
                                value:this.table7,
                                itemStyle: {
                                    color: '#FF6347'
                                }
                            }, 
                        ]
                    }]
                };
                // <!-- 使用刚指定的配置项和数据显示图表 -->
                myChart.setOption(option)
            },
            mchartsline(){
                echartslist().then(res => {
                    this.table1 = res.data[0].sumbe;
                    this.table2 = res.data[1].sumbe;
                    this.table3 = res.data[2].sumbe;
                    this.table4 = res.data[3].sumbe;
                    this.table5 = res.data[4].sumbe;
                    this.table6 = res.data[5].sumbe;
                    this.table7 = res.data[6].sumbe;
                    // console.log(this.table1);
                })
            	// <!-- 基于准备好的dom，初始化echarts实例 -->
                const myChart = echarts.init(document.getElementById('echartsline'));
                // <!-- 指定图表的配置项和数据 -->
                const option = {
                    title: {
                        text: '茶叶点击量折线图'
                    },
                    tooltip: {},
                    xAxis: {    //  x轴的下标
                        data: ["白茶", "金骏眉", "春茶", "滇茶", "铁观音", "大红袍",'普洱']
                    },
                    yAxis: {    //  y轴
                        type: 'value'
                    },
                    series: [{   //  y轴的数据
                        name: '点击量',
                        type: 'line',    //  bar为柱状图，line为折线图，pie为饼图
                        data: [
                            this.table1,
                            this.table2, 
                            this.table3, 
                            this.table4, 
                            this.table5, 
                            this.table6,
                            this.table7]
                    }]
                };
                // <!-- 使用刚指定的配置项和数据显示图表 -->
                myChart.setOption(option)
            },
            mchartsround() {
                echartslist().then(res => {
                    this.table1 = res.data[0].sumbe;
                    this.table2 = res.data[1].sumbe;
                    this.table3 = res.data[2].sumbe;
                    this.table4 = res.data[3].sumbe;
                    this.table5 = res.data[4].sumbe;
                    this.table6 = res.data[5].sumbe;
                    this.table7 = res.data[6].sumbe;
                    // console.log(this.table1);
                    const myChart = echarts.init(document.getElementById('mchartsround'));
                    const option = {
                    title: {
                        text: '茶叶点击饼形图'
                    },
                    tooltip: {},
                    xAxis: {    //  x轴的下标
                        data: []
                    },
                    yAxis: {    //  y轴
                        type: 'value'
                    },
                    series: [{   //  y轴的数据
                        name: '点击量',
                        type: 'pie',    //  bar为柱状图，line为折线图，pie为饼图
                        data: [
                            {value:this.table1, name:'白茶'}, 
                            {value:this.table2, name:'金骏眉'}, 
                            {value:this.table3, name:'春茶'}, 
                            {value:this.table4, name:'滇茶'}, 
                            {value:this.table5, name:'铁观音'}, 
                            {value:this.table6, name:'大红袍'}, 
                            {value:this.table7, name:'普洱'}, 
                            ]
                    }]
                };
                    // <!-- 使用刚指定的配置项和数据显示图表 -->
                    myChart.setOption(option)
                })
            }
        }
    }

</script>

<style lang="less" scoped>

</style>
