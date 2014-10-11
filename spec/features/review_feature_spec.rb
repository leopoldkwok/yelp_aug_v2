require 'rails_helper'

describe 'reviewing restaurants' do 
	before do 
		Restaurant.create(name: 'KFC')
	end

	it 'allows users to leave reviews using a form, which appear alongside a restaurant' do 
		visit '/restaurants'
		click_link 'Review KFC'
		fill_in 'Thoughts', with: 'so so'
		select '3', from: 'Rating'
		click_button 'Leave review'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'so so (3)'
	end


end