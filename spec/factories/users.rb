FactoryBot.define do
  factory :user do
    name "testuser"
    sequence(:email){|n| "testuser{n}@example.com"}
    password "123456"
    password_confirmation "123456"
  end
end
