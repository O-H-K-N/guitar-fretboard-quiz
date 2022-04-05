class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.text :content
      t.string :strings, null: false, array: true, default: []
      t.string :frets, null: false, array: true, default: []
      t.string :answer, null: false
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
