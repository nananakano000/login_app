<template>
  <div>
    <h3>マイページ</h3>
    <br>
    <p>今日のログイン回数</p>
    <p>{{ user.login_counter_today }}</p>
    <p>総ログイン回数</p>
    <p>{{ user.login_counter_all }}</p>
    <br>
    <button @click="editUser">ユーザ情報を編集</button>
    <br><br>
    <button @click="logout">ログアウト</button>
  </div>
</template>

<script>
import axios from 'axios';
import { log } from 'util';

export default {
  components: {
  },
  data() {
    return {
      user: {}
    }
  },
  mounted(){
    axios
    .get(`/api/v1/users/${this.$route.params.id}.json`)
    .then(response => {
      this.user = response.data;
      alert('ログインボーナス･:*+.\(( °ω° ))/.:+\n 魔法石を100個ゲットしました。');
      });
  },
  methods: {
    logout: function(){
      this.$router.push({ name: 'LoginPage' });
    },
    editUser: function(){
      this.$router.push({ name: 'UserEditPage', params: { id: this.user.id }});
    }
  }
}
</script>

<style scoped>
</style>