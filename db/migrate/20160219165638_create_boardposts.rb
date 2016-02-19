class CreateBoardposts < ActiveRecord::Migration
  def change
    create_table :boardposts do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
