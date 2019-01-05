FactoryBot.define do
  factory :user do
    name "test user"
    sequence(:email){|n| "testuser#{n}@example.com"}
    password "password"
    password_confirmation "password"
    
    trait :with_comments do
      after(:create){|user| create_list(:comment, 5, user: user) }
    end
    
    trait :with_likes do
      after(:create){|user| create_list(:like, 5, user: user) }
    end
    
    trait :with_bookmarks do
      after(:create){|user| create_list(:bookmark, 5, user: user)}
    end
    
  end
end
