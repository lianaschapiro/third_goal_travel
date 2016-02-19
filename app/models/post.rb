class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :comments, dependent: :destroy
end
