import Vue from 'vue'
import App from '../app.vue'
import router from '../router/index.js'
import axios from '../plugins/axios'
import { library } from '@fortawesome/fontawesome-svg-core';
import { fas } from '@fortawesome/free-solid-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import 'bootstrap/dist/css/bootstrap.css'

Vue.config.productionTip = false
Vue.prototype.$axios = axios
library.add(fas, far, fab)
Vue.component('font-awesome-icon', FontAwesomeIcon)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})