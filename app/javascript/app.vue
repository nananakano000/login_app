<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import LoginPage from 'LoginPage.vue'
import UserPage from 'UserPage.vue'
import UserListPage from './UserListPage.vue'
import UserDetailPage from './UserDetailPage.vue'
import UserNewPage from './UserNewPage.vue'
import UserEditPage from './UserEditPage.vue'

const router = new VueRouter({
  routes: [
    { path: '/users/list',
      name: 'UserListPage',
      component: UserListPage  },
    { path: '/users/:id(\\d+)',  // :idは数値のみに制限する
      name: 'UserDetailPage',
      component: UserDetailPage },
    { path: '/users/new',
      name: 'UserNewPage',
      component: UserNewPage    },
    { path: '/users/:id(\\d+)/edit',
      name: 'UserEditPage',
      component: UserEditPage   },
    { path: '/login',
      name: 'LoginPage',
      component: LoginPage   },
    { path: '/users/:id(\\d+)',
      name: 'UserPage',
      component: UserPage   }
  ]
})

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vue.use(VueRouter)

export default {
  router
}
</script>

<style scoped>
</style>