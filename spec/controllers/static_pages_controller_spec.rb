require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET index" do
    it "renders successfully" do
      get :index
      expect(subject).to respond_with 200
    end
  end
end
