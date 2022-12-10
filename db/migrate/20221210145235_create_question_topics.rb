class CreateQuestionTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :question_topics do |t|
      t.references :question_id
      t.references :topic_id

      t.timestamps
    end
  end
end
