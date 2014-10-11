require 'rails_helper'

describe 'endorsing reviews' do 
	before do
		kfc = Restaurant.create(name: 'KFC')
		kfc.reviews.create(rating: 3, thoughts: 'OK')
	end

	it "can endorse reviews, updating the review's endorsement count" do 
		visit '/restaurants'
		click_link 'Endorse this review'
		expect(page).to have_content '1 endorsement'
	end
end
