require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid with name, email, password, password_confirmation" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
end
