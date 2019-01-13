require 'rails_helper'

RSpec.feature "Edit user profile", type: :feature do
  let(:user){FactoryBot.create(:user)}
  
  scenario "user edit own profile" do
    sign_in user
    
    visit edit_user_registration_path(user)
    fill_in "Name", with: "yuki"
    fill_in "Email", with: "yuki@example.com"
    fill_in "Website", with: "http://foobar.co.jp"
    fill_in "Bio", with: "hello"
    click_button "Update"
    user.reload
    expect(user.name).to eq("yuki")
    expect(user.email).to eq("yuki@example.com")
    expect(user.website).to eq("http://foobar.co.jp")
    expect(user.bio).to eq("hello")
  end
  
end