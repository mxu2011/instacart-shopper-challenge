require 'rails_helper'

RSpec.describe ApplicationStep, type: :model do
  describe "database table" do
    it { is_expected.to have_db_index([:funnel_id, :shopper_applicant_id]) }
  end

  describe "associations" do
    it { is_expected.to belong_to :funnel }
    it { is_expected.to belong_to :shopper_applicant }
  end

  describe "model validations" do
    subject { create(:application_step) }

    it { is_expected.to validate_presence_of(:funnel) }
    it { is_expected.to validate_presence_of(:shopper_applicant) }

    it { is_expected.to validate_uniqueness_of(:funnel_id).scoped_to(:shopper_applicant_id) }
  end
end
