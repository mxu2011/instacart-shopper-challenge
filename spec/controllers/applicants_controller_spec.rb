require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do
  let(:applicant) { create(:shopper_applicant) }

  describe "GET show" do
    it "renders successfully for a signed in applicant" do
      sign_in(applicant)
      get :show
      expect(subject).to respond_with 200
    end

    it "redirects to the root path for a visitor" do
      get :show
      expect(response).to redirect_to root_path
    end
  end

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

    it "provides a success flash message on success" do
      post :create, params: { shopper_applicant: attributes_for(:shopper_applicant) }
      expect(subject).to set_flash[:success]
    end

    it "provides a warn flash message on failure" do
      post :create, params: { shopper_applicant: attributes_for(:shopper_applicant, email: "") }
      expect(subject).to set_flash.now[:warning]
    end
  end

  describe "GET confirm" do
    it "renders successfully for a signed in applicant" do
      sign_in(applicant)
      get :confirm
      expect(subject).to respond_with 200
    end

    it "redirects to the root path for a visitor" do
      get :confirm
      expect(subject).to redirect_to root_path
    end
  end

  describe "POST accept" do
    it "accepts the background check for a signed in applicant" do
      sign_in(applicant)
      post :accept
      expect(applicant.reload.background_check_accepted_at).to be_present
    end

    it "redirects to the root path for a visitor" do
      post :accept
      expect(response).to redirect_to root_path
    end
  end

  describe "GET edit" do
    it "renders successfully for a signed in applicant" do
      sign_in(applicant)
      get :edit
      expect(subject).to respond_with 200
    end

    it "redirects to the root path for a visitor" do
      get :edit
      expect(response).to redirect_to root_path
    end
  end

  describe "PATCH update" do
    it "updates a signed in applicant with valid attributes" do
      sign_in(applicant)
      patch :update, params: { shopper_applicant: { first_name: "Zebulon" }}
      expect(applicant.reload.first_name).to eq("Zebulon")
    end

    it "does not update a signed in applicant with invalid attributes" do
      sign_in(applicant)
      patch :update, params: { shopper_applicant: { first_name: "" }}
      expect(applicant.reload.first_name).not_to eq("")
    end

    it "redirects to the root path for a visitor" do
      patch :update, params: { shopper_applicant: attributes_for(:shopper_applicant) }
      expect(response).to redirect_to root_path
    end

    it "provides a success flash message on success" do
      sign_in(applicant)
      patch :update, params: { shopper_applicant: { first_name: "Zebulon" }}
      expect(subject).to set_flash[:success]
    end

    it "provides a warn flash message on failure" do
      sign_in(applicant)
      patch :update, params: { shopper_applicant: { first_name: "" }}
      expect(subject).to set_flash.now[:warning]
    end
  end
end
