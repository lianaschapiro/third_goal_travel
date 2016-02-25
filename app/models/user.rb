class User < ActiveRecord::Base
	has_secure_password

	has_many :reviews, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :boardposts, dependent: :destroy
end
