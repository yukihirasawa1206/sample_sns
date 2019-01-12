require 'rails_helper'

RSpec.feature "Posts", type: :feature do

	let(:user){FactoryBot.create(:user)}

	scenario "user create a post" do
		sign_in user
		visit posts_path

		expect{
			fill_in "post_content", with: "test post"
			# attach_file "images[]", "#{Rails.root}/spec/support/files/attachment.jpg"
			click_button "Post"
		}.to change(user.posts, :count).by(1)
	end

end
