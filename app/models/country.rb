class Country < ActiveRecord::Base
	belongs_to :region	
	has_many :journals
	has_many :reviews
	has_many :boardposts


  	def to_param
    	url_name
  	end
end
