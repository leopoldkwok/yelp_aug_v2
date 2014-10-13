require 'rails_helper'

	describe 'editing restaurants' do 
		before(:each) do 
			@alex = User.create(email: "a@a.com", password:"12345678", password_confirmation: "12345678")
			@alex.restaurants.create(name: 'KFC')
			login_as @alex
		end


 		context 'logged in as the restaurant creator' do 
 			before do 
 				login_as @alex
 			end

				it 'prompts the user to fill out a form, then displays the new restaurant' do 
					visit '/restaurants'   
					click_link 'Edit KFC'

					fill_in 'Name', with: 'Kentucky Fried Chicken'
					click_button 'Update Restaurant'

					expect(page).to have_content 'Kentucky Fried Chicken'
					expect(current_path).to eq '/restaurants'
				end
			end

		context 'logged in as another user' do 
			before do 
				talal = User.create(email: 'talal@example.com',password:"12345678", password_confirmation: "12345678")
				login_as talal
			end
			
				it 'should display an error' do 
					visit '/restaurants'
					click_link 'Edit KFC'

					expect(page).to have_content 'This is not your restaurant!'
				end
		end

	end