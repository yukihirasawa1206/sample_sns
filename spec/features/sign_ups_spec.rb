require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

	let(:user) {FactoryBot.build(:user)}

	scenario "user signs up" do
		visit root_path
		click_link "Sign up"

		fill_in "Your name", with: user.name
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		fill_in "Password confirmation", with: user.password_confirmation

		click_button "Sign up"
		expect(page).to have_content ""
		# expect(page).to have_content "Create Post"
	end
end
