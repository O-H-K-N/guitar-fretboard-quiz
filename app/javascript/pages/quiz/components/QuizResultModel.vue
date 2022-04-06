<template>
  <div id="quiz-confirmation-modal">
    <div class="modal">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">結果発表</h5>
          </div>
          <template v-if="numberOfQuizzes == score">
            <div class="modal-body text-center">
              <h4>{{ numberOfQuizzes }}問中{{ score }}問正解です！</h4>
              <h4 style="red">すごい！全問正解です！</h4>
            </div>
          </template>
          <template v-else>
            <div class="modal-body text-center">
              <h4>{{ numberOfQuizzes }}問中<span>{{ score }}問</span>正解です！</h4>
            </div>
          </template>
          <div class="modal-footer">
            <button @click="handleCloseQuizModel" class="btn btn-secondary" data-dismiss="modal">終了</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show" />
  </div>
</template>

<script>
export default {
  name: "QuizResultModel",
  props: {
    overallResults: {
      type: Array,
      required: true
    },
  },
  data() {
    return {
      score_counter: 0,
    }
  },
  computed: {
    numberOfQuizzes() {
      return this.overallResults.length
    },
    score() {
      this.score_counter =  this.overallResults.filter(e => e == 'correct' )
      return this.score_counter.length
    },
  },
  methods: {
    handleCloseQuizModel() {
      this.$emit('close-quiz')
    },
  }
}
</script>

<style scoped>
.modal{
  display: block;
}
span{
  color: red;
}
</style>