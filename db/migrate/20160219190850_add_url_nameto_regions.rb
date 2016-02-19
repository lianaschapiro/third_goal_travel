class AddUrlNametoRegions < ActiveRecord::Migration
  def change
  	add_column :regions, :url_name, :string
  end
end
