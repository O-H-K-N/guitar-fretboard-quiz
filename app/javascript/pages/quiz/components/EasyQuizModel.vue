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
                <button @click="handleOpenQuizConfirmationModel" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
              </div>
            </template>
            <template v-if="answered">
              <div class="modal-header">
                <h5 class="modal-title" :id="'question-answer-' + questionIndex+1">{{ result }}</h5>
              </div>
              <div class="modal-body">
                <p>正しい回答：{{ current_answer }}. {{ current_answer_text }}</p>
                <p>あなたの回答：{{ user_answer }}. {{ user_answer_text }}</p>
              </div>
              <div class="modal-footer">
                <button @click="nextQuiz"  class="btn btn-success" data-bs-toggle="modal" data-dismiss="modal">NEXT</button>
                <button @click="handleOpenQuizConfirmationModel" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
              </div>
            </template>
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
      questionIndex: 0,
      answers: [],
      result: "",
      answered: false,
      current_answer: 0,
      current_answer_text: "",
      user_answer: 0,
      user_answer_text: "",
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
    nextQuiz(){
      this.result = '';
      this.answered = false
      // 正答数カウンター
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
    judgeAnswer(key) {
      // 正誤チェッカー
      this.answers.push(key);
      this.answered = true;
      this.current_answer = this.questions[this.questionIndex].answer + 1
      this.current_answer_text = this.questions[this.questionIndex].options[this.current_answer - 1]
      this.user_answer = key + 1
      this.user_answer_text = this.questions[this.questionIndex].options[key]
      if(key == this.questions[this.questionIndex].answer) {
        this.result = '正解'
      } else {
        this.result = '不正解'
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