<template>
  <div id="quiz-easy">
    <div class="modal">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <template
            v-if="!startFlag"
          >
            <div class="modal-body text-center">
              <button @click="startFlag = true"  class="btn btn-success" data-bs-toggle="modal" data-dismiss="modal">START</button>
              <button @click="handleCloseCloseQuizModel" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
            </div>
          </template>
          <template v-else>
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">aaa</h5>
            </div>
            <div class="modal-body">
              <p>aaaa</p>
            </div>
            <div class="modal-footer">
              <button @click="handleOpenQuizConfirmationModel" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
            </div>
          </template>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show"></div>
    <QuizConfirmationModel
      v-if="isVisibleCloseQuizConfirmationModel"
      @close-quiz="handleCloseCloseQuizModel"
      @close-confirmation="handleCloseQuizConfirmationModel"
    />
  </div>
</template>

<script>
import QuizConfirmationModel from './QuizConfirmationModel.vue'

export default {
  name: "QuizEasy",
  components: { QuizConfirmationModel },
  data() {
    return {
      startFlag: false,
      isVisibleCloseQuizConfirmationModel: false,
    }
  },
  methods: {
    handleOpenQuizConfirmationModel() {
      this.isVisibleCloseQuizConfirmationModel = true;
    },
    handleCloseQuizConfirmationModel() {
      this.isVisibleCloseQuizConfirmationModel = false;
    },
    handleCloseCloseQuizModel() {
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