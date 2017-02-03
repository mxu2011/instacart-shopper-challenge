require 'rails_helper'

RSpec.describe Funnel, type: :model do
  describe "database table" do
    it { is_expected.to have_db_column(:name).of_type(:string) }

    it { is_expected.to have_db_index(:name) }
  end

  describe "associations" do
    it { is_expected.to have_many :application_steps }
    it { is_expected.to have_many :shopper_applicants }
  end

  describe "model validations" do
    subject { create(:funnel) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
