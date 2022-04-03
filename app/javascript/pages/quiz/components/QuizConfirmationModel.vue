<template>
  <div id="quiz-confirmation-modal">
    <div class="modal">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-body text-center">
            <p>クイズの途中ですが終了しますか？</p>
            <button @click="handleCloseQuizModel"  class="btn btn-success" data-bs-toggle="modal" data-dismiss="modal">はい</button>
            <button @click="handleCloseQuizConfirmationModel" class="btn btn-secondary" data-dismiss="modal">いいえ</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show" />
  </div>
</template>

<script>
export default {
  name: "QuizEasy",
  methods: {
    handleCloseQuizConfirmationModel() {
      this.$emit('close-confirmation')
    },
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
</style>