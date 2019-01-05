FactoryBot.define do
  
  factory :comment do
    sequence(:content){|n| "test comments #{n}"}
    association :post
    association :user
  end
  
end
