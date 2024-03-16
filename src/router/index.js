import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      //首页
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
      // 电影首页
      path: '/MovieHome',
      name: 'MovieHome',
      component: () => import('../components/MovieHome.vue')
    },
    {
      // 首页
      path: '/MovieHome/Home',
      name: 'Home',
      component: () => import('../components/Home.vue')
    },
    {
      // 电影
      path: '/MovieHome/Movie',
      name: 'Movie',
      component: () => import('../components/Movie.vue')
    },
    {
      // 影院
      path: '/MovieHome/Cinema',
      name: 'Cinema',
      component: () => import('../components/Cinema.vue')
    }
  ]
})

export default router
