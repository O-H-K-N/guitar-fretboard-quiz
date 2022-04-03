<template>
  <div class='container style="height: 100%;'>
    <div class='top-inner-text text-center'>
      <p class='title-logo text-light'>{{ app_name }}</p>
      <div class='quiz-select-field neumorphism'>
        <button class="btn btn-outline-light font-weight-bold filter-none px-3 m-3" type="button">{{ level1}} </button><br>
        <button class="btn btn-outline-light font-weight-bold px-3 m-3" type="button">{{ level2 }}</button><br>
        <button class="btn btn-outline-light font-weight-bold px-3 m-3" type="button">{{ level3 }}</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "TopIndex",
  data() {
    return {
      app_name: "Quiz Guitar Chord",
      level1: "E A S Y",
      level2: "M I D D L E",
      level3: "H I G H"
    }
  }
}
</script>

<style scoped>
.container {
  padding: 15px;
}

.quiz-select-field {
  width: 60%;
  margin-top: 40px;
  margin-left: auto;
  margin-right: auto;
  }

.neumorphism {
  border-radius: 10px;
  box-shadow: 5px 5px 10px #a3adb3, -5px -5px 10px #ddebf3;
  background-color: rgba(95, 50, 8, 0.5);
}

.title-logo {
  margin-top: 150px;
  font-size: 30px;
  background-color: rgba(95, 50, 8, 0.5);
  border: medium solid white;
  box-shadow: 2px 3px 4px #a3adb3, -2px -2px 4px #ddebf3;
}
</style>
