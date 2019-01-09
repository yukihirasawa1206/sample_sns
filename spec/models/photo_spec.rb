require 'rails_helper'

RSpec.describe Photo, type: :model do

	it "should have a valid factory" do
		photo = FactoryBot.build(:photo)
		expect(photo).to be_valid
	end
end
