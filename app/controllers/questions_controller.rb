class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new]

  def generate_questions
    Question.get_questions(current_user)
    render 'questions/start.html.slim'
  end

  def new
    @question = Question.get_question(current_user)
    @answers = @question.answers.split(':').sample(5) if !@question.nil?
    if @question.nil?
      current_user.update(score_correct: current_user.questions.select{|a| a.score == "true"}.size, score_incorrect: current_user.questions.select{|b| b.score == "false"}.size)
      render 'result.html.slim'
    end
  end

  def update
    @question = Question.find(params[:question_id])
    score_answer = params[:question][:score]
    @question.update(score: 'true') if score_answer == @question.answer
    @question.update(user_answer: score_answer)
    redirect_to action: "new"
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:score)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
