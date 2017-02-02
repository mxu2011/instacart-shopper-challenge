module ApplicantsHelper
  def submit_message(applicant)
    applicant.persisted? ? "Update Application" : "Apply!"
  end
end
