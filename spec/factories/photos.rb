FactoryBot.define do
  factory :photo do
		image { Rack::Test::UploadedFile.new(Rails.root.
					 join('spec/support/files/attachment.jpg'), 'image/jpeg') }
		association :post
  end
end
