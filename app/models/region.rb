class Region < ActiveRecord::Base
	has_many :countries

	def to_param
    	url_name
  	end
end
