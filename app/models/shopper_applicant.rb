class ShopperApplicant < ApplicationRecord
  attr_accessor :background_check_accepted

  has_many :application_steps, dependent: :destroy
  has_many :funnels, through: :application_steps

  validates :first_name, presence: true, length: { maximum: 127 }
  validates :last_name, presence: true, length: { maximum: 127 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 127 }
  validates :phone_number, presence: true, length: { maximum: 24 }
  validates :zip_code, presence: true, length: { maximum: 18 }

  before_save -> {
    if !background_check_accepted_at && background_check_accepted
      self.background_check_accepted_at = Time.now
    end
  }

  scope :applied_between, -> (start_date, end_date) {
    where(
      "shopper_applicants.created_at > ? AND shopper_applicants.created_at < ?",
      start_date, end_date
    )
  }

  def self.weekly_application_status
    joins(:funnels).
    group("week_start").
    order("week_start").
    select(
      "date_trunc('week', shopper_applicants.created_at) AS week_start, " +
      "COUNT(*) AS applied, " +
      Funnel::STEPS.map do |step|
        "SUM(CASE WHEN funnels.name = '#{step}' THEN 1 ELSE 0 END) as #{step}"
      end.join(", ")
    )
  end

  def name
    first_name + " " + last_name
  end
end
