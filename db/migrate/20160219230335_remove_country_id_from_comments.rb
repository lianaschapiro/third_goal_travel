class RemoveCountryIdFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :country_id
  end
end
