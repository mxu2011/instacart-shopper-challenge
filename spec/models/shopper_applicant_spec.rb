require 'rails_helper'

RSpec.describe ShopperApplicant, type: :model do
  describe "database table" do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:zip_code).of_type(:string) }
  end

  describe "model validations" do
    subject { create(:shopper_applicant) }

    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :phone_number }
    it { is_expected.to validate_presence_of :zip_code }

    it { is_expected.to validate_uniqueness_of :email }
  end
end
