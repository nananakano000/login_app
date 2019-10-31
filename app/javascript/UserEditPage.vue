<template>
  <div>
    <h3>ユーザ情報を編集</h3>
    <br>
    <user-form-table :errors="errors" :user="user" @submit="updateUser"></user-form-table>
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
      user: {},
      errors: ''
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  },
  methods: {
    updateUser: function() {
      axios
        .patch(`/api/v1/users/${this.user.id}`, this.user)
        .then(response => {
          this.$router.push({ name: 'UserDetailPage', params: { id: this.user.id } });
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