require 'rails_helper'

RSpec.feature "DeleteUsers", type: :feature do
  
  let(:user){FactoryBot.create(:user)}
  
  scenario "user delete own account", js: true do
    sign_in user
    
    visit edit_user_registration_path(user)
    expect {
      click_link "Delete account"
      expect(page).to have_content "Are you sure?"
      within(".modal-content") do
        find(" input[type='text']").set("#{user.name}")
      end
      click_button "Confirm"
    }.to change(User, :count).by(-1)
  end
end
