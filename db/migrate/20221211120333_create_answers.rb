class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :user
      t.references :question
      t.string :body

      t.timestamps
    end
  end
end
