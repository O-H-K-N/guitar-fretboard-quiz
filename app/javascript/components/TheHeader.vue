<template>
  <header>
    <nav class="navbar navbar-light">
      <div class="container-sm">
        <router-link to="/" class="navbar-brand d-flex align-items-center">
          <span class="text-light">{{ app_name }}</span>
        </router-link>
      </div>
    </nav>
  </header>
</template>

<script>
export default {
  name: "TheHeader",
  data() {
    return {
      app_name: "Quiz Guitar Chord"
    }
  },
}
</script>

<style scoped>
header{
  background-color: rgba(245, 245, 220, 0.4);
  box-shadow: 0px 2px 4px #ddebf3, 0px -2px 4px #ddebf3;
}
</style>
