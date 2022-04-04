class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.text :content
      t.string :options, null: false, array: true, default: []
      t.integer :answer, null: false, default: 0
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
