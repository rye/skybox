require 'spec_helper'

describe 'lib/skylark.rb' do

	it 'can be required without error' do
		expect do
			require 'skylark'
		end.not_to raise_error
	end

end
