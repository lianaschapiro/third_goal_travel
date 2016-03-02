class User < ActiveRecord::Base
	has_secure_password

	has_many :reviews, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :journals, dependent: :destroy
	has_many :boardposts, dependent: :destroy

	validates_presence_of :fname, :lname, :email
	validates_presence_of :password, on: :create
end
