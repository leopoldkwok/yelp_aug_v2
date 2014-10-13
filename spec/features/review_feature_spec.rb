require 'rails_helper'

describe 'reviewing restaurants' do 
	before do 
		alex = User.create(email: "a@a.com", password:"12345678", password_confirmation: "12345678")
		login_as alex
		alex.restaurants.create(name: 'KFC')
	end

	it 'allows users to leave reviews using a form, which appear alongside a restaurant' do 
		leave_review('so so',3)

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'so so (★★★☆☆)'
	end

	it 'display the average rating from all reviews' do 
		leave_review('so so',3)

		talal = User.create(email: 'talal@example.com',password:"12345678", password_confirmation: "12345678")
		login_as talal
		leave_review('great',5)

		expect(page).to have_content 'Average rating: ★★★★☆'
	end

	it 'does not allower users to write duplicate reviews' do 
		leave_review('so so', 3)
		expect(page).not_to have_link 'Review KFC'
	end
end