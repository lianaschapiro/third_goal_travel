class AddAuthorToJournals < ActiveRecord::Migration
  def change
  	add_column :journals, :author, :string
  end
end
