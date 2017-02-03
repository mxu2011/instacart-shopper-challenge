module ApplicantsHelper
  def submit_message(applicant)
    applicant.persisted? ? "Update Application" : "Apply!"
  end

  def inline_errors(errors, field_name)
    content_tag(:span,
      field_name.to_s.gsub("_", " ").capitalize +
      " " +
      errors[field_name].join(", ") +
      ".",
      class: "text-danger"
    ) if errors[field_name].present?
  end
end
