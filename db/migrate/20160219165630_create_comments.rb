class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
