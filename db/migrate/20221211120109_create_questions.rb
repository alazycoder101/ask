class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :user
      t.string :title
      t.string :body
      t.timestamp :answered_at
      t.integer :views_count, null: false, default: 0
      t.integer :answers_count, null: false, default: 0
      t.integer :comments_count, null: false, default: 0

      t.timestamps
    end
  end
end
