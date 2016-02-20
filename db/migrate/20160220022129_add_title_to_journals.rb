class AddTitleToJournals < ActiveRecord::Migration
  def change
  	add_column :journals, :title, :string
  end
end
