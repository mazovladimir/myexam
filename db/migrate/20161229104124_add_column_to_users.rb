class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :score_correct, :string
     add_column :users, :score_incorrect, :string
  end
end
