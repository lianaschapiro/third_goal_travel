class CreatePostcomments < ActiveRecord::Migration
  def change
    create_table :postcomments do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :boardpost, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
