class Postcomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :boardpost

  validates_presence_of :body, :user_id, :boardpost_id
end
