class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :body, :latitude, :longitude, :address, :full_address, :user_id, :country_id 

  enum post_type: [:restaurant, :hotel, :other]

 	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude, :address => :full_address

	after_validation :reverse_geocode


	def self.search(search)
		where("title ILIKE ? OR body ILIKE ? OR full_address ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end

end
