class RemoveForeignKeyFromComments < ActiveRecord::Migration
  def change
  	remove_foreign_key :comments, column: :country_id
  end
end
