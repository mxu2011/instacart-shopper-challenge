FactoryGirl.define do
  factory :application_step do
    association :shopper_applicant
    association :funnel
  end
end
