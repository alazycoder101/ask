class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.reference :reviewable, polymorphic: true, index: true
      t.references :user
      t.string :body

      t.timestamps

    end
  end
end
