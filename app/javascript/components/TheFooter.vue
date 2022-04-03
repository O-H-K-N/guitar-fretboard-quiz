<template>
  <footer>
    <nav class="navbar navbar-light">
      <div class='container-sm'>
        <span class="text-light">{{ footer_app_name }}</span>
      </div>
    </nav>
  </footer>
</template>

<script>
export default {
  name: "TheFooter",
  data() {
    return {
      footer_app_name: "© 2022 Quiz Guitar Chord"
    }
  },
}
</script>

<style scoped>
footer{
  background-color: rgba(245, 245, 220, 0.4);
  box-shadow: 0px 2px 4px #ddebf3, 0px -2px 4px #ddebf3;
}
</style>
