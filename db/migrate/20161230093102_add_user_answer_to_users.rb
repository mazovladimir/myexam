class AddUserAnswerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user_answer, :string
  end
end
