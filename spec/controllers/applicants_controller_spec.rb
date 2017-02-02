require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do
  describe "GET new" do
    it "renders successfully" do
      get :new
      expect(subject).to respond_with 200
    end
  end

  describe "POST create" do
    it "does not create an applicant with invalid attributes" do
      expect{
        post :create, params: {
          shopper_applicant: attributes_for(:shopper_applicant, email: "")
        }
      }.not_to change(ShopperApplicant, :count)
    end

    it "creates an applicant with valid attributes" do
      expect{
        post :create, params: {
          shopper_applicant: attributes_for(:shopper_applicant)
        }
      }.to change(ShopperApplicant, :count).by 1
    end
  end

  describe "GET confirmation" do
    it "renders successfully" do
      get :complete
      expect(subject).to respond_with 200
    end
  end
end
