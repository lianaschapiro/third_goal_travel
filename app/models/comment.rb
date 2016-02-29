class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates_presence_of :body, :user_id, :review_id
end
