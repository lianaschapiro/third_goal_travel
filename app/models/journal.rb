class Journal < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  validates_presence_of :title, :link, :user_id, :country_id
end
