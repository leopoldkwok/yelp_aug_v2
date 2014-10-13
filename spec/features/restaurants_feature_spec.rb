require 'rails_helper'

	describe 'restaurants' do 
		context 'no restaurants have been added' do 
			it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
			end
		end

		context 'restaurants have been added' do 
			before(:each) do 
			Restaurant.create(name: 'McDonalds')
		end

			it 'should display them' do
				visit '/restaurants'
				expect(page).to have_content 'McDonalds'
			end
		end



	describe 'deleting restaurants' do 
		before(:each) do 
			Restaurant.create(name: 'KFC')
			alex = User.create(email: "a@a.com", password:"12345678", password_confirmation: "12345678")
			login_as alex
			
		end

		it 'removes restaurants when a user clicks a delete link' do 
			visit '/restaurants' 
			click_link 'Delete KFC'

			expect(page).not_to have_content 'KFC'
			expect(page).to have_content 'Restaurant deleted successfully'
		end
	end
end