require 'rails_helper'

describe 'reviewing restaurants' do 
	before do 
		Restaurant.create(name: 'KFC')
	end

	it 'allows users to leave reviews using a form, which appear alongside a restaurant' do 
		leave_review('so so',3)

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'so so (★★★☆☆)'
	end

	it 'display the average rating from all reviews' do 
		leave_review('so so',3)
		leave_review('great',5)

		expect(page).to have_content 'Average rating: ★★★★☆'
	end
end