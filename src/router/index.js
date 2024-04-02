import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      //登录页面
      path: '/',
      name: 'HomeView',
      component: HomeView
    },
    {
      // 注册页面
      path: '/Register',
      name: 'Register',
      component: () => import('../views/Register.vue')
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

router.beforeEach((to, from, next) => {
  const user = checkUserLogin();

  if (!user) {
    if (to.name !== 'HomeView' && to.name !== 'Register') {
      next('/');
    } else {
      next();
    }
  } else {
    const role = parseInt(localStorage.getItem('userID'));

    if (to.name === 'AdminHome' && role !== 1) {
      next(false)
      router.go(-1);
    } else {
      next();
    }
  }
})




//验证用户是否登录
function checkUserLogin() {
  return localStorage.getItem('userID') !== null
}
export default router
