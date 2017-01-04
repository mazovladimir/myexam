class AddColumnsToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :ask, :string
    add_column :questions, :score, :string, default: "false"
    add_column :questions, :answer, :string
    add_column :questions, :answers, :string
  end
end
