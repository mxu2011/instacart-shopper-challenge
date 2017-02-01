require 'rails_helper'

RSpec.describe FunnelsController, type: :controller do
  let(:future_date) {  }

  describe "GET index" do
    it "succeeds without dates" do
      get :index, format: :json
      expect(subject).to respond_with 200
    end

    it "succeeds with valid dates" do
      get(:index,
        format: :json,
        params: {
          start_date: "2014-09-29",
          end_date: "2014-12-31"
        })
    end

    it "succeeds with invalid dates" do
      get(:index,
        format: :json,
        params: {
          start_date: "2014",
          end_date: "2015"
        })
    end

    it "succeeds with dates in the future" do
      get(:index,
        format: :json,
        params: {
          start_date: "2050-12-31",
          end_date: "2051-12-31"
        })
    end
  end
end
