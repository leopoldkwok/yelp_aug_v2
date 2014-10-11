require 'rails_helper'

RSpec.describe ReviewsHelper, :type => :helper do 
	describe '#star_rating' do 
		it 'does nothing if rating is not a number' do 
			expect(helper.star_rating('N/A')).to eq 'N/A'
		end

		it 'returns 5 black stars for 5' do 
			expect(helper.star_rating(5)).to eq '★★★★★'
		end

		it 'returns 3 black stars and 2 white stars for 3' do 
			expect(helper.star_rating(3)).to eq '★★★☆☆'
		end

		it 'rounds to the nearest stars for non-whole numbers' do 
			expect(helper.star_rating(3.5)).to eq '★★★★☆'

		end

	end
end