class FunnelsController < ApplicationController
  def index
    @funnels = ShopperApplicant.
      applied_between(start_date, end_date).
      weekly_application_status
  end


  private

  def start_date
    @start_date ||= parse_date_param(params[:start_date].to_s)
  end

  def end_date
    @end_date ||= parse_date_param(params[:end_date].to_s)
  end

  def parse_date_param(date_param)
    DateTime.strptime(date_param, "%Y-%m-%d")
  rescue ArgumentError
    DateTime.now
  end
end
