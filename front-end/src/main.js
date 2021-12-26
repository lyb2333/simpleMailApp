import Vue from 'vue'
import App from './App.vue'
import './assets/css/reset.css'
import './icons'

Vue.config.productionTip = false

new Vue({
  render: h => h(App)
}).$mount('#app')
