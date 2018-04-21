<template>
  <div id="app">
    <h1>Hello ! Your ip is {{myip}}. {{country}} {{city}}</h1>
    <span>source code: {{code_version}}. runtime env: {{runtime_env}}</span>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'App',
  data () {
    return {
      code_version: 'local test',
      runtime_env: 'local',
      myip: '0.0.0.0',
      city: 'Chengdu',
      country: 'China'
    }
  },
  created () {
    /* global CODE_VERSION:false, API_URL:false */
    this.code_version = CODE_VERSION || this.code_version
    this.runtime_env = process.env.NODE_ENV
    axios.get(API_URL).then(result => {
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
    background: url(https://dynamic.thoughtworks.com/landing_pages/full_width_image_desktop-03801d8bdff4556807329690ead6287f.png) no-repeat center center #295448;
    text-align: center;
}

</style>
