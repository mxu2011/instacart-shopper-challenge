class Funnel < ApplicationRecord
  STEPS = [
    :quiz_started,
    :quiz_completed,
    :onboarding_requested,
    :onboarding_completed,
    :hired,
    :rejected
  ]

  has_many :application_steps, dependent: :destroy
  has_many :shopper_applicants, through: :application_steps

  validates :name, presence: true, uniqueness: true
end
