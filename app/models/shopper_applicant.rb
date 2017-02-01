class ShopperApplicant < ApplicationRecord
  has_many :application_steps
  has_many :funnels, through: :application_steps

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :zip_code, presence: true
end
