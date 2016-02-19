class AddUrlNametoCountries < ActiveRecord::Migration
  def change
  	add_column :countries, :url_name, :string
  end
end
