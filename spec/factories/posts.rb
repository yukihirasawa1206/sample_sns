FactoryBot.define do
  factory :post do
    sequence(:content){|n| "This is test post #{n}."}
    association :user
    
    trait :with_comments do
      after(:create) {|post| create_list(:comment, 5, post: post)}
    end
    
    trait :with_likes do
      after(:create) {|post| create_list(:like, 5, post: post)}
    end
    
    trait :with_bookmarks do
      after(:create) {|post| create_list(:bookmark, 5, post: post)}
    end
    
  end
end
