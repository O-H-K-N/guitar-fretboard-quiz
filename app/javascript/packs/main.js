import Vue from 'vue'
import App from '../app.vue'
import router from '../router/index.js'
import axios from '../plugins/axios'
import 'bootstrap/dist/css/bootstrap.css'

Vue.config.productionTip = false
Vue.prototype.$axios = axios

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})