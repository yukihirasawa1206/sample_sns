require 'rails_helper'

RSpec.describe Comment, type: :model do
	before do
		@comment = FactoryBot.create(:comment)
	end

	it "has a valid factory" do
		expect(@comment).to be_valid
	end

	it "is invalid without user_id" do
		@comment.user_id = nil
		@comment.valid?
		expect(@comment.errors[:user_id]).to include("can't be blank")
	end

	it "is invalid without post_id" do
		@comment.post_id = nil
		@comment.valid?
		expect(@comment.errors[:post_id]).to include("can't be blank")
	end

	it "is invalid with content length more than 50 char" do
		@comment.content= "a" * 51
		@comment.valid?
		expect(@comment.errors[:content]).to include("is too long (maximum is 50 characters)")
	end
	
end
