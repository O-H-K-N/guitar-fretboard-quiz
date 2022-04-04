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
                <h5 class="modal-title" :id="'quiz-label-' + (quizIndex+1)">第 {{ (quizIndex+1) }} 問　{{ currentQuiz.title }}</h5>
              </div>
              <div class="modal-body">
                <button
                  type="button"
                  class="btn btn-primary btn-lg btn-block text-left"
                  v-for="(option, key) in currentQuiz.options"
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
                <h5 class="modal-title" :id="'quiz-answer-' + (quizIndex+1)">第 {{ (quizIndex+1) }} 問　{{ currentQuiz.title }}</h5>
              </div>
              <div class="modal-body text-center">
                <h4 :style="{ color: fontColor }">{{ result }}</h4>
                <h5 v-if="currentQuiz.content">{{ currentQuiz.content }}</h5>
                <span>正しい回答：{{ current_answer }}</span><br>
                <span>あなたの回答：{{ user_answer }}</span>
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
      quizIndex: 0,
      answers: [],
      result: "",
      overallResults: [],
      answered: false,
      current_answer: "",
      user_answer: "",
      next: '次へ',
      quizzes: [],
      startFlag: false,
      fontColor: "",
      isVisibleQuizConfirmationModel: false,
      isVisibleQuizResultModel: false,
    }
  },
  created() {
    // 呼び出したAPIからQuiz情報を取得
    this.fetchQuizzes();
  },
  computed: {
    // 解答中のクイズ
    currentQuiz() {
      return this.quizzes[this.quizIndex];
    }
  },
  methods: {
    fetchQuizzes() {
      this.$axios.get("quizzes")
        .then(res => this.quizzes = res.data)
        .catch(err => console.log(err.status));
    },
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
      if(this.quizzes.length == this.answers.length) {
        this.isVisibleQuizResultModel = true;
      } else {
        this.quizIndex++;
        this.answered = false
      }
    },
    // 正誤チェッカー
    judgeAnswer(key) {
      this.answers.push(key);
      this.answered = true;
      this.current_answer = this.currentQuiz.options[this.currentQuiz.answer]
      this.user_answer = this.currentQuiz.options[key]
      if(this.quizzes.length == this.answers.length) {
        this.next = '結果発表';
      }
      if(key == this.currentQuiz.answer) {
        this.fontColor = 'red';
        this.result = '正解🙆‍♂️';
        this.overallResults.push('correct');
      } else {
        this.fontColor = 'blue';
        this.result = '不正解🙅‍♂️';
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