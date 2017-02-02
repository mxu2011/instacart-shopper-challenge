require 'rails_helper'

RSpec.describe ShopperApplicant, type: :model do
  let(:applicant) { create(:shopper_applicant) }

  describe "database table" do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:zip_code).of_type(:string) }
  end

  describe "associations" do
    it { is_expected.to have_many :application_steps }
    it { is_expected.to have_many :funnels }
  end

  describe "model validations" do
    subject { create(:shopper_applicant) }

    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :phone_number }
    it { is_expected.to validate_presence_of :zip_code }

    it { is_expected.to validate_uniqueness_of :email }

    it { is_expected.to validate_length_of(:first_name).is_at_most(127) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(127) }
    it { is_expected.to validate_length_of(:email).is_at_most(127) }
    it { is_expected.to validate_length_of(:phone_number).is_at_most(24) }
    it { is_expected.to validate_length_of(:zip_code).is_at_most(18) }
  end


  describe ".applied_between" do
    let(:beginning_of_week) { DateTime.new(2015, 1, 1).beginning_of_week }

    let(:applicant_this_week) {
      create(:shopper_applicant, created_at: beginning_of_week + 2.days)
    }
    let(:applicant_previous_week) {
      create(:shopper_applicant, created_at: beginning_of_week - 2.days)
    }

    it "includes new applicants from the given timeframe" do
      expect(ShopperApplicant.applied_between(
        beginning_of_week, beginning_of_week + 7.days
      )).to include(applicant_this_week)
    end

    it "excludes new applicants outside the given timeframe" do
      expect(ShopperApplicant.applied_between(
        beginning_of_week, beginning_of_week + 7.days
      )).not_to include(applicant_previous_week)
    end
  end


  describe "background_check_accepted" do
    it "does not record the time if it is not accepted" do
      applicant.save
      expect(applicant.background_check_accepted_at).to be nil
    end

    it "records the time of the first acceptance" do
      applicant.background_check_accepted = true
      applicant.save
      expect(applicant.background_check_accepted_at).not_to be nil
    end

    it "does not record the time for a second acceptance" do
      applicant.background_check_accepted = true
      applicant.save
      expect{applicant.save}.not_to change(applicant, :background_check_accepted_at)
    end
  end
end
