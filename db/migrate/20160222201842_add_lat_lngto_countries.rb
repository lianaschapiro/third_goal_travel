class AddLatLngtoCountries < ActiveRecord::Migration
  def change
  	add_column :countries, :latitude, :float
  	add_column :countries, :longitude, :float
  end
end
