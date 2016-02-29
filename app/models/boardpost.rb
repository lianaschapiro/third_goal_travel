class Boardpost < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :postcomments

  validates_presence_of :title, :body, :user_id, :country_id
  
end
