<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>UserName</label>
      <input v-model="user.user_name" type="text">
    </div>
    <div>
      <label>UserID</label>
      <input v-model="user.uid" type="text">
    </div>
    <div>
      <label>Password</label>
      <input v-model="user.password" type="text">
    </div>

    <button type="submit">Commit</button>
  </form>
</template>

<script>
export default {
  props: {
    user: {},
    errors: ''
  }
}
</script>

<style>
</style>