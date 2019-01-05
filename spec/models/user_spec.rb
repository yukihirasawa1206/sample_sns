require 'rails_helper'

RSpec.describe User, type: :model do

	before do
		@user = FactoryBot.build(:user)
	end
  
  it "has a valid factory" do
		expect(@user).to be_valid
  end

	it "is invalid user without name" do
		@user.name = nil
		@user.valid?
		expect(@user.errors[:name]).to include("can't be blank")
	end
	
	it "is invalid with too long name" do
		@user.name = "a" * 51
		@user.valid?
		expect(@user.errors[:name]).to include("is too long (maximum is 50 characters)")
	end
	
	it "is invalid without email" do
		@user.email = nil
		@user.valid?
		expect(@user.errors[:email]).to include("can't be blank")
	end
	
	it "is invalid with wrong address" do
		@user.email = "wrong address"
		@user.valid?
		expect(@user.errors[:email]).to include("is invalid")
	end
	
	it "is invalid with duplicate address" do
		@user.save
		@duplicate_address = FactoryBot.build(:user, email: "#{@user.email}")
		@duplicate_address.valid?
		expect(@duplicate_address.errors[:email]).to include("has already been taken")
	end
	
	it "is invalid without password" do
		@user.password = nil
		@user.valid?
		expect(@user.errors[:password]).to include("can't be blank")
	end
	
	it "is invalid with password is shorter than 6 char" do
		@user.password = "a" * 5
		@user.valid?
		expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
	end
	
	it "is invalid with unmatch password confirmation" do
		@user.password_confirmation = "wrong password"
		@user.valid?
		expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
	end
	
	describe "can have many resouces" do
		
		it "can have many comments" do
			@user_with = FactoryBot.create(:user, :with_comments)
			expect(@user_with.comments.count).to eq 5
		end
		
		it "can have many likes" do
			@user_with = FactoryBot.create(:user, :with_likes)
			expect(@user_with.likes.count).to eq 5
		end
		
		it "can have many bookmarks" do
			@user_with = FactoryBot.create(:user, :with_bookmarks)
			expect(@user_with.bookmarks.count).to eq 5
		end
		
	end
	
	describe "search name for a term" do
		
		before do
				@taro = FactoryBot.create(:user, name: "taro", email: "taro@test.com")
				@jiro = FactoryBot.create(:user, name: "jiro", email: "jiro@test.com") 
				@hanako = FactoryBot.create(:user, name: "hanako", email: "hanako@test.com") 
		end
		
		context "when match is found" do
			it "returns user" do
				expect(User.search("o")).to include(@taro, @jiro, @hanako)
				expect(User.search("ro")).to include(@taro, @jiro)
			end
		end
		
		context "when match is not found" do
			it "returns an empty collection" do
				expect(User.search("z")).to be_empty
			end
		end
		
	end
	
	
end