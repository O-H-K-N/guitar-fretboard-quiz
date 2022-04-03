<template>
  <div id="app" class="jumbotron" >
    <TheHeader class="mb-auto" />
    <div class="wrapper">
      <router-view/>
    </div>
    <TheFooter class="fixed-bottom" />
  </div>
</template>

<script>
import TheHeader from 'components/TheHeader.vue'
import TheFooter from 'components/TheFooter.vue'

export default {
  name: 'App',
  components: { TheHeader, TheFooter }
}
</script>

<style scoped>
.jumbotron {
  position: relative;
  height: 100vh;
  background-position: right;
  background-image: linear-gradient(rgba(199, 141, 75, 0.5),rgba(0, 0, 0, 0.5)),url('../assets/images/background.jpg');
  background-size: cover;
  border-radius: 0;
  padding: 0px;
  margin-bottom: 0px;
}

.wrapper {
  flex: 1 1 auto;
  max-width: 100%;
  position: relative;
}
</style>