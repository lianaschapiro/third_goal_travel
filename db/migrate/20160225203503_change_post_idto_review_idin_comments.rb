class ChangePostIdtoReviewIdinComments < ActiveRecord::Migration
  def change
  	rename_column :comments, :post_id, :review_id
  end
end
