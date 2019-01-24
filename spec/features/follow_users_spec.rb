require 'rails_helper'

RSpec.feature "FollowUsers", type: :feature do
  
  let(:user){FactoryBot.create(:user)}
  let(:other_user){FactoryBot.create(:user)}
  
  scenario "user follow other user", js: true do
    visit root_path
    sign_in user
    
    visit user_path(other_user)
    expect{
      click_button "Follow"
      sleep 1
    }.to change(user.following, :count).by(1)
  end
  
  scenario "user unfollow other user", js: true do
    visit root_path
    sign_in user
    visit user_path(other_user)
    expect{
      click_button "Follow"
      sleep 1
    }.to change(user.following, :count).by(1)
    
    expect{
      click_button "Unfollow"
      sleep 1
    }.to change(user.following, :count).by(-1)
    
  end
end
