require 'rails_helper'

RSpec.feature "SignIns", type: :feature do

	let(:user){FactoryBot.create(:user)}

	scenario "user signs in" do
		visit root_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Log in"
		expect(page).to have_content "Create Post"
	end
end
