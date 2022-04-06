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
            <button
              class="btn btn-primary text-white shadow col-5"
              @click="twitterShare"
            >
              <font-awesome-icon :icon="['fab', 'twitter']" />
                シェアする
            </button>
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
    twitterShare() {
      var shareURL =
      'https://twitter.com/intent/tweet?text='
      +
      'ギター指板クイズ'
      +
      '%0a'
      +
      `${this.numberOfQuizzes}問中${this.score}問正解です！`
      +
      '%0a'
      +
      '%20%23ギター指板クイズ'
      +
      '%0a'
      +
      '%20%23弾いてみた'
      +
      '%0a'
      +
      '%20%23弾き語り'
      +
      '%0a'
      +
      '&url='
      +'https://guitar-fretboard-quiz.herokuapp.com/';
      window.open(shareURL, '_blank')
    }
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