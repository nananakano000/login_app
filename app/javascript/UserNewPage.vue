<template>
  <div>
    <h3>新規ユーザ登録</h3>
    <br>
    <user-form-table :errors="errors" :user="user" @submit="createUser"></user-form-table>
    <br><br>
    <router-link :to="{ name: 'LoginPage' }">ログインページに戻る</router-link>
  </div>
</template>

<script>
import axios from 'axios';

import UserFormTable from 'UserFormTable.vue';

export default {
  components: {
    UserFormTable
  },
  data() {
    return {
      user: {
        user_name: '',
        uid: '',
        password: ''
      },
      errors: ''
    }
  },
  methods: {
    createUser: function() {
      axios
        .post('/api/v1/users', this.user)
        .then(response => {
          let u = response.data;
          this.$router.push({ name: 'UserDetailPage', params: { id: u.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>