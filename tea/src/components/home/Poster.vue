<template>
  <div class="poster">
    <ul>
			<li
			v-for='(item,index) in adList' :key='index'>
				<img :src="item.imgUrl" />
			</li>
		</ul>
  </div>
</template>

<script>

export default {
  name:'Poster',
  props:{
    adList:Array
  },
  data () {
    return {
    }
  },
}
</script>

<style lang="less" scoped>
.poster{
  width: 100%;
  img{
    width: 100%;
    height: 100%;
  }
}
</style>
