<template>
  <div>
    <h3>登録ユーザ一覧</h3>
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>ユーザネーム</th>
          <th>ユーザID</th>
          <th>パスワード</th>
          <th>actions</th>
        </tr>
        <tr v-for="e in users" :key="e.id">
          <td><router-link :to="{ name: 'UserDetailPage', params: { id: e.id } }">{{ e.id }}</router-link></td>
          <td>{{ e.user_name }}</td>
          <td>{{ e.uid }}</td>
          <td>{{ e.password }}</td>
          <td>
            <button @click="deleteTarget = e.id; showModal = true">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>

    <router-link :to="{ name: 'LoginPage' }">ログインページに戻る</router-link>

    <modal v-if="showModal" @cancel="showModal = false" @ok="deleteUser(); showModal = false;">
      <div slot="body">Are you sure?</div>
    </modal>
  </div>
</template>

<script>
import axios from 'axios';

import Modal from 'Modal.vue'

export default {
  components: {
    Modal
  },
  data: function () {
    return {
      users: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
    }
  },
  mounted () {
    this.updateUsers();
  },
  methods: {
    deleteUser: function() {
      if (this.deleteTarget <= 0) {
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/v1/users/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateUsers();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    updateUsers: function() {
      axios
        .get('/api/v1/users.json')
        .then(response => (this.users = response.data))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>