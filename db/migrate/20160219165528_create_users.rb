class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.text :about
      t.boolean :admin
      t.boolean :volunteer

      t.timestamps null: false
    end
  end
end
