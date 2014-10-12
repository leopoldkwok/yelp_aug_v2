require 'rails_helper'

RSpec.describe Restaurant, :type => :model do 

		it 'is not valid with a name of < 2 charcters' do 
		restaurant = Restaurant.new(name: 'Ab')
		expect(restaurant).to have(1).error_on(:name)
	end


	it 'is not valid if it does not start with an uppcase letter' do 
		restaurant = Restaurant.new(name: 'nandos')
		expect(restaurant).to have(1).error_on(:name)
	end

	it 'is not valid if it is not unique' do
		Restaurant.create(name: 'Nandos')
		restaurant = Restaurant.new(name: 'Nandos')
		expect(restaurant).to have(1).error_on(:name)
	end


	# let(:restaurant) {Restaurant.create(name:'Nando')}
	
	# describe '#average_rating' do 
	# 	context 'no reviews' do 
	# 		it 'returns N/A' do 
	# 			expect(restaurant.average_rating).to eq 'N/A'
	# 		end
	# 	end

	# 	context '1 review' do 
	# 		it 'returns that rating' do 
	# 			restaurant.reviews.create(rating: 4)
	# 			expect(restaurant.average_rating).to eq 4
	# 		end
	# 	end

	# 	context 'multiples review' do
	# 		it 'return the average of all ratings' do 
	# 			restaurant.reviews.create(rating: 3) 
	# 			restaurant.reviews.create(rating: 5)
	# 			expect(restaurant.average_rating).to eq 4
	# 		end

	# 		it 'returns a float, if average is a non-whole number' do 
	# 			restaurant.reviews.create(rating: 4)
	# 			restaurant.reviews.create(rating: 5)
	# 			expect(restaurant.average_rating).to eq 4.5
	# 		end

	# 	end






	# end 

	# describe 'validation' 
	
		

	

end

