import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      //登录注册页面
      path: '/',
      name: 'HomeView',
      component: HomeView
    },
    {
      //管理员页面
      path: '/AdminHome',
      name: 'AdminHome',
      component: () => import('../views/AdminHomeView.vue')
    },
    {
      // 首页
      path: '/Home',
      name: 'Home',
      component: () => import('../components/Home.vue')
    },
    {
      // 影院
      path: '/Cinema',
      name: 'Cinema',
      component: () => import('../components/Cinema.vue')
    },
    {
      // 电影详细信息
      path: '/Movie',
      name: 'Movie',
      component: () => import('../components/Movie.vue')
    },
    {
      // 买票页面
      path: '/BuyTickets',
      name: 'BuyTickets',
      component: () => import('../components/BuyTickets.vue')
    },
    {
      // 用户信息页面
      path: '/UserInfo',
      name: 'UserInfo',
      component: () => import('../components/UserInfo.vue')
    }, {
      // 选择时间页面
      path: '/ChooseTime',
      name: 'ChooseTime',
      component: () => import('../components/ChooseTime.vue')
    }
  ]
})

export default router
