FactoryGirl.define do
  factory :funnel do
    sequence(:name) { |n| "step#{n}" }
  end
end
