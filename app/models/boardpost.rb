class Boardpost < ActiveRecord::Base
  belongs_to :user
  belongs_to :country

  validates_presence_of :title, :body, :user_id, :country_id
  
end
