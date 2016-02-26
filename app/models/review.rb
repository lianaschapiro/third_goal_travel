class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :comments, dependent: :destroy

  enum post_type: [:restaurant, :hotel, :other]

 	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude, :address => :full_address

	after_validation :reverse_geocode


	def self.search(search)
		# where("title ILIKE ?", "%#{search}%") 
		
		# where("body ILIKE ?", "%#{search}")
		# where("full_address ILIKE ?", "%#{search}%")
		where("title ILIKE ? OR body ILIKE ?", "%#{search}%", "%#{search}%")
	end

end
