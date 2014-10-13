require 'rails_helper'
require 'launchy'


	describe 'creating restaurants' do 

		context 'logged out' do 
			it 'should prompt to sign in' do 
				visit '/restaurants'
				click_link 'Add a restaurant'

				expect(page).to have_content 'Sign in'
			end
		end

		context 'logged in' do 
			before do 
				alex = User.create(email: "a@a.com", password:"12345678", password_confirmation: "12345678")
				login_as alex	
			end

			context 'a valid restaurant' do	

				it 'promps the user to fill out a form, then displays the new restaurant' do 
					visit '/restaurants'
					click_link 'Add a restaurant'
					# save_and_open_page
					fill_in 'Name', with: 'KFC'
					click_button 'Create Restaurant'

					expect(page).to have_content 'KFC'
					expect(current_path).to eq '/restaurants'
				end
			end 

			context 'an invalid restaurant' do
				it 'shows an error because of an uncaptialised name that is too short' do
					visit '/restaurants'
					click_link 'Add a restaurant'
					fill_in 'Name', with: 'ab'

					click_button 'Create Restaurant'
					expect(page).not_to have_css 'h2', text: 'ab'
					expect(page).to have_content 'errors' 
				end
				
			end
		end
	
	end