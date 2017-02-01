class ShopperApplicant < ApplicationRecord
  has_many :application_steps
  has_many :funnels, through: :application_steps

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :zip_code, presence: true

  scope :applied_between, -> (start_date, end_date) {
    where(
      "shopper_applicants.created_at > ? AND shopper_applicants.created_at < ?",
      start_date, end_date
    )
  }

  def self.funnel_analytics(start_date, end_date)
    joins(:funnels).
    applied_between(start_date, end_date).
    group("week_start").
    select(
      "date_trunc('week', shopper_applicants.created_at) AS week_start, " +
      "COUNT(*) AS applied, " +
      Funnel::STEPS.map do |step|
        "SUM(CASE WHEN funnels.name = '#{step}' THEN 1 ELSE 0 END) as #{step}"
      end.join(", ")
    )
  end
end
