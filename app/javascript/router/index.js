import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)
Vue.config.productionTip = false

const router = new Router({
  mode: 'history',
  routes: [
    // トップページ
    // {
    //   path: '/',
    //   name: 'TopIndex',
    //   component: TopIndex
    // },
  ],
})

export default router