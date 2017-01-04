class User < ApplicationRecord
  has_many :questions

  attr_accessor :a, :check_questions, :all_questions
  #Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.get_questions(myuser)
    @myuser = myuser
    #@myuser.all_questions = Question.all.to_a.sample(5)
    #Question.create(@myuser.all_questions.attributes.slice('ask', 'answer', 'answers' ))
    Question.all.sample(5).each {|q| myuser.questions.create(q.slice('ask', 'answer', 'answers')) }
    @myuser.all_questions = Question.where(user_id: myuser.id).to_a
    @myuser.check_questions = @myuser.all_questions.clone
  end

  def self.get_question
    @myuser.a = @myuser.all_questions.pop
  end

  #def self.check_answer
  #  @myuser.a.answer
  #end

  #def self.update_answer
  #  @myuser.check_questions.each { |q| q.update(score: "true") if q.id == @myuser.a.id }
  #end

  #def self.record_user_answer(score_answer)
  #  @myuser.check_questions.each { |q| q.user_answer = score_answer if q.id == @myuser.a.id }
  #end

  def self.last_question?
    @myuser.all_questions.empty?
  end

  def self.correct_result(myuser)
    #myuser.update(score_correct: @myuser.check_questions.select{|a| a.score == "true"}.size)
  end

  def self.incorrect_result(myuser)
    #myuser.update(score_incorrect: @myuser.check_questions.select{|b| b.score == "false"}.size)
  end

  def self.get_answers
    @myuser.check_questions
  end

  def self.user_answers
    @myuser.check_questions
  end
end
