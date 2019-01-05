require 'rails_helper'

RSpec.describe User, type: :model do

	before do
		@user = FactoryBot.build(:user)
	end
  
  it "is valid with name, email, password, password_confirmation" do
		expect(@user).to be_valid
  end

	it "is invalid user with name" do
		@user.name = nil
		@user.valid?
		expect(@user.errors[:name]).to include("can't be blank")
	end

	it "is invalid user with email" do
		@user.email = nil
		@user.valid?
		expect(@user.errors[:email]).to include("can't be blank")
	end
end
