class ApplicationStep < ApplicationRecord
  belongs_to :funnel
  belongs_to :shopper_applicant

  validates :funnel, presence: true
  validates :shopper_applicant, presence: true

  validates :funnel_id, uniqueness: { scope: :shopper_applicant_id }
end
