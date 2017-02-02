class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  protected

  def applicant_signed_in?
    !!current_applicant
  end

  def current_applicant
    @current_applicant ||= ShopperApplicant.find_by_email(session[:email])
  end

  def sign_in(applicant)
    session[:email] = applicant.email
  end

  def authenticate_applicant!
    redirect_to root_path unless applicant_signed_in?
  end
end
