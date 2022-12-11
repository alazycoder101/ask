class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :user
      t.string :title
      t.string :body
      t.timestamp :answered_at
      t.integer :views_count
      t.integer :answers_count
      t.integer :comments_count

      t.timestamps
    end
  end
end
