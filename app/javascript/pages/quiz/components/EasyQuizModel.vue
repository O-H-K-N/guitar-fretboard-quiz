<template>
  <div id="easy-quiz-model">
    <div class="modal">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <template
            v-if="!startFlag"
          >
            <div class="modal-body text-center">
              <button @click="startFlag = true"  class="btn btn-success" data-bs-toggle="modal" data-dismiss="modal">始める</button>
              <button @click="handleCloseQuizModel" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
            </div>
          </template>
          <template v-else>
            <template v-if="!answered">
              <div class="modal-header">
                <h5 class="modal-title" :id="'question-label-' + questionIndex+1">第 {{ (questionIndex+1) }} 問　{{ currentQuestion.question }}</h5>
              </div>
              <div class="modal-body">
                <button
                  type="button"
                  class="btn btn-primary btn-lg btn-block text-left"
                  v-for="(option, key) in currentQuestion.options"
                  :key="key"
                  @click="judgeAnswer(key)"
                >
                  {{ (key+1) }}. {{ option }}
                </button>
              </div>
              <div class="modal-footer">
                <button @click="handleOpenQuizConfirmationModel" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
              </div>
            </template>
            <template v-if="answered">
              <div class="modal-header">
                <h5 class="modal-title" :id="'question-answer-' + questionIndex+1">{{ result }}</h5>
              </div>
              <div class="modal-body">
                <p>正しい回答：{{ current_answer }}</p>
                <p>あなたの回答：{{ user_answer }}</p>
              </div>
              <div class="modal-footer">
                <button @click="nextQuiz"  class="btn btn-success" data-bs-toggle="modal" data-dismiss="modal">{{ next }}</button>
                <button @click="handleOpenQuizConfirmationModel" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
              </div>
            </template>
            <transition name="fade">
              <QuizConfirmationModel
                v-if="isVisibleQuizConfirmationModel"
                @close-quiz="handleCloseQuizModel"
                @close-confirmation="handleCloseQuizConfirmationModel"
              />
              <QuizResultModel
                v-if="isVisibleQuizResultModel"
                :overallResults="overallResults"
                @close-quiz="handleCloseQuizModel"
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
import QuizResultModel from './QuizResultModel.vue'

export default {
  name: "EasyQuizModel",
  components: { QuizConfirmationModel, QuizResultModel },
  data() {
    return {
      questionIndex: 0,
      answers: [],
      result: "",
      overallResults: [],
      answered: false,
      current_answer: "",
      user_answer: "",
      next: '次へ',
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
      isVisibleQuizConfirmationModel: false,
      isVisibleQuizResultModel: false,
    }
  },
  computed: {
    // 解答中のクイズ
    currentQuestion() {
      return this.questions[this.questionIndex];
    }
  },
  methods: {
    handleOpenQuizConfirmationModel() {
      this.isVisibleQuizConfirmationModel = true;
    },
    handleCloseQuizConfirmationModel() {
      this.isVisibleQuizConfirmationModel = false;
    },
    handleCloseQuizModel() {
      this.$emit('close-quiz')
    },
    nextQuiz(){
      this.answered = false
      if(this.questions.length == this.answers.length) {
        this.isVisibleQuizResultModel = true;
      } else {
        this.questionIndex++;
      }
    },
    // 正誤チェッカー
    judgeAnswer(key) {
      this.answers.push(key);
      this.answered = true;
      this.current_answer = this.currentQuestion.options[this.currentQuestion.answer]
      this.user_answer = this.currentQuestion.options[key]
      if(this.questions.length == this.answers.length) {
        this.next = '結果発表';
      }
      if(key == this.currentQuestion.answer) {
        this.result = '正解'
        this.overallResults.push('correct');
      } else {
        this.result = '不正解'
        this.overallResults.push('incorrect');
      }
    }
  }
}
</script>

<style scoped>
.modal{
  display: block;
}
</style>