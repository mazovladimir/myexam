class Question < ApplicationRecord
  belongs_to :user, optional: true

  def self.get_questions(myuser)
    @myuser = myuser
    Question.all.sample(5).each {|q| myuser.questions.create(q.slice('ask', 'answer', 'answers')) } if myuser.questions.empty?
  end

  def self.get_question(myuser)
    Question.where(user_id: myuser.id, user_answer: nil).take
  end
end
