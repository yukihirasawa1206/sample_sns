require 'rails_helper'

RSpec.describe Like, type: :model do
  
	before do
		@like = FactoryBot.create(:like)
	end

	it "has a valid factory" do
		expect(@like).to be_valid
	end

	it "is invalid without user_id" do
		@like.user_id = nil
		@like.valid?
		expect(@like.errors[:user_id]).to include("can't be blank")
	end

	it "is invalid without post_id" do
		@like.post_id = nil
		@like.valid?
		expect(@like.errors[:post_id]).to include("can't be blank")
	end

end
