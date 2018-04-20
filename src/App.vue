<template>
  <div id="app">
    <h1>Hello ! Your ip is {{myip}}. {{country}} {{city}}</h1>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'App',
  data () {
    return {
      myip: '0.0.0.0',
      city: 'Chengdu',
      country: 'China'
    }
  },
  created () {
    axios.get('http://ip-api.com/json').then(result => {
      this.myip = result.data.query
      this.city = result.data.city
      this.country = result.data.country
    })
  }
}
</script>

<style>

#app {
    padding: 5em 0;
    height: 200px;
    color: #fff;
    background: url(https://www.thoughtworks.cn/assets/images/general/banner.png) no-repeat center center #295448;
    text-align: center;
}

</style>
