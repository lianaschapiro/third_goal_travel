class RenamePoststoReviews < ActiveRecord::Migration
  def change
  	rename_table :posts, :reviews
  end
end
