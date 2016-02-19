class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  # belongs_to :country
end
