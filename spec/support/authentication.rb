module Authentication
  def sign_in(applicant)
    session[:email] = applicant.email
  end
end
