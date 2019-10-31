<template>
  <div>
    <h3>ユーザ情報</h3>
    <br>
    <dl>
      <dt>ID</dt>
      <dd>{{ user.id }}</dd>
      <dt>ユーザネーム</dt>
      <dd>{{ user.user_name }}</dd>
      <dt>ユーザID</dt>
      <dd>{{ user.uid }}</dd>
      <dt>パスワード</dt>
      <dd>{{ user.password }}</dd>
      <dt>今日のログイン回数</dt>
      <dd>{{ user.login_counter_today }}</dd>
    </dl>
    <br><br>
    <router-link :to="{ name: 'LoginPage' }">ログインページに戻る</router-link>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      user: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  }
}
</script>

<style scoped>
</style>