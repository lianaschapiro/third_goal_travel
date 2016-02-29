class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :comments, dependent: :destroy

  enum post_type: [:restaurant, :hotel, :other]

  validates_presence_of :title, :body
  validates_presence_of :post_type, :address, :country_id, :user_id, :latitude, :longitude, on: :create
  
 	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude, :address => :full_address

	after_validation :reverse_geocode


	def self.search(search)
		where("title ILIKE ? OR body ILIKE ? OR full_address ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end

end
