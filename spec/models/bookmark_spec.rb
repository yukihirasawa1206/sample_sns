require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  
	before do
		@bookmark = FactoryBot.create(:bookmark)
	end

	it "has a valid factory" do
		expect(@bookmark).to be_valid
	end

	it "is invalid without user_id" do
		@bookmark.user_id = nil
		@bookmark.valid?
		expect(@bookmark.errors[:user_id]).to include("can't be blank")
	end

	it "is invalid without post_id" do
		@bookmark.post_id = nil
		@bookmark.valid?
		expect(@bookmark.errors[:post_id]).to include("can't be blank")
	end
	
end
