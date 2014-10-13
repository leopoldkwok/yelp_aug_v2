 class Review < ActiveRecord::Base
	VALID_RATINGS = (1..5)

 	belongs_to :restaurant
 	belongs_to :user
 	has_many :endorsements

 	validates :rating, inclusion: VALID_RATINGS
 	validates :restaurant_id, presence: true 
 	# ensures the review has a restaurant //
 	validates :user_id, uniqueness: {scope: :restaurant_id, message: 'has already written a review '}
 	#unique pairing of a user id paired with restaurant  can not appear twice
 end
