<template>
  <div>
    <h3>ログインページ</h3>
    <br><br>
    <p v-if="failureMessageFlg">※登録されていません。</p>
    
    <p class="font-weight-bold text-secondary">ユーザID</p>
    <b-form-input v-model="userId" placeholder="入力してください。"></b-form-input><br><br>
    
    <p class="font-weight-bold text-secondary">パスワード</p>
    <b-form-input
      :id="`type-${password}`"
      type="password" v-model="password"
      placeholder="入力してください。"
    ></b-form-input>

    <br><br><br>

    <b-button
      variant="outline-primary"
      @click="loginCheck();"
    >
    ログイン</b-button><br><br>
    <b-button
      variant="outline-primary"
      @click="createUser();"
    >
    ユーザ新規作成</b-button><br><br>
    <router-link :to="{ name: 'UserListPage' }">ユーザ一覧</router-link>
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
      userId: '',
      password: '',
      users: [],
      failureMessageFlg: false
    }
  },
  mounted(){
    this.updateUsers();
  },
  methods: {
    loginCheck: function(){
      let loginCheckFlg = false;
      let successUser = {};

      this.users.forEach(e => {
        if(e.uid === this.userId && e.password === this.password){
          loginCheckFlg = true;
          successUser = e;
        }
      });

      if(loginCheckFlg){
        this.loginSuccess(successUser);
      }else{
        this.loginFailure();
      }
    },

    incLoginCountToday(e){
      if(e.login_counter_today === null){
        e.login_counter_today = 1;
      }else{
        e.login_counter_today ++;
      }
    },
    incLoginCountAll(e){
      if(e.login_counter_all === null){
        e.login_counter_all = 1;
      }else{
        e.login_counter_all ++;
      }
    },

    loginSuccess: function(e){

      this.incLoginCountAll(e);

      let today = new Date();
      let todayMonthDate = today.getMonth()+1 +'/'+ today.getDate();

      // 初回処理
      if(e.last_login_date === null){
        e.last_login_date = todayMonthDate;
      }
      // last_login_dateと同日
      if(e.last_login_date === todayMonthDate){
        this.incLoginCountToday(e);
      
      // last_login_dateより後日
      }else{
        e.last_login_date = todayMonthDate;
        e.login_counter_today = 1;
      }

      // login_counterを更新し、画面遷移
      axios
        .patch(`/api/v1/users/${e.id}`, e)
        .then(response => {
          this.$router.push({ name: 'UserPage', params: { id: e.id } });
        })
        .catch(error => {
          console.error(error);
        });
    },

    loginFailure: function(){
      this.failureMessageFlg = true;
      this.userId = '';
      this.password = '';
    },

    createUser(){
      this.$router.push({ name: 'UserNewPage' });
    },

    updateUsers: function() {
      axios
        .get('/api/v1/users.json')
        .then(response => (this.users = response.data))
    },
  }
}
</script>

<style scoped>
</style>