<template>
  <div id="easy-quiz-model">
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
            <h5 class="modal-title" :id="'question-label-' + questionIndex+1">第 {{ (questionIndex+1) }} 問　{{ currentQuestion.question }}</h5>
            </div>
            <div class="modal-body">
              <button
                type="button"
                class="btn btn-primary btn-lg btn-block text-left"
                v-for="(option, key) in currentQuestion.options"
                :key="key"
                @click="addAnswer(key)"
              >
                {{ (key+1) }}. {{ option }}
              </button>
            </div>
            <div class="modal-footer">
              <button @click="handleOpenQuizConfirmationModel" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
            </div>
            <transition name="fade">
              <QuizConfirmationModel
                v-if="isVisibleCloseQuizConfirmationModel"
                @close-quiz="handleCloseCloseQuizModel"
                @close-confirmation="handleCloseQuizConfirmationModel"
              />
            </transition>
          </template>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show"></div>
  </div>
</template>

<script>
import QuizConfirmationModel from './QuizConfirmationModel.vue'

export default {
  name: "QuizEasy",
  components: { QuizConfirmationModel },
  data() {
    return {
      answers: [],
      questionIndex: 0,
      questions: [
        {
          question: '「A」の音は？',
          options: [
              '６弦開放',
              '５弦開放',
              '４弦開放',
              '３弦開放',
          ],
          answer: 1
        },
        {
          question: '「C」の音は？',
          options: [
              '６弦４フレット',
              '５弦３フレット',
              '４弦２フレット',
              '３弦１フレット',
          ],
          answer: 1
      },
        {
          question: '「D」の音は？',
          options: [
              '３弦開放',
              '２限開放',
              '２弦３フレット',
              '１弦３フレット',
          ],
          answer: 2
        }
      ],
      startFlag: false,
      isVisibleCloseQuizConfirmationModel: false,
    }
  },
  computed: {
    currentQuestion() {
      return this.questions[this.questionIndex];
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
    // 正答数カウンター
    addAnswer(key) {
      this.answers.push(key);
      if(this.questions.length == this.answers.length) {
        var correctCount = 0;
        for(var i in this.answers) {
          var answer = this.answers[i];
          if(answer == this.questions[i].answer) {
              correctCount++;
          }
        }
        alert(this.questionIndex+1 + '問中' + correctCount +'問正解です！');
        this.$emit('close-quiz')
      } else {
        this.questionIndex++;
      }
    },
  }
}
</script>

<style scoped>
.modal{
  display: block;
}
</style>