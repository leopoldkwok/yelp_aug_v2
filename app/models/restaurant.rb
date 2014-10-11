class Restaurant < ActiveRecord::Base

	has_many :reviews, dependent: :destroy
	validates :name, length: {minimum: 3}, uniqueness: true

	def average_rating
		return 'N/A' if reviews.none?
		# reviews.inject(0) do |sum, review|
		# 	sum + review.rating
		reviews.average(:rating)

	end
end
