class AddTypetoPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :type, :integer
  end
end
