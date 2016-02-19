class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.float :longitude
      t.float :latitude
      t.string :title
      t.text :body
      t.string :address
      t.string :full_address
      t.references :user, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
