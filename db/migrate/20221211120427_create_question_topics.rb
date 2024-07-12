class CreateQuestionTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :question_topics do |t|
      t.references :question
      t.references :topic

      t.timestamps
    end
  end
end
