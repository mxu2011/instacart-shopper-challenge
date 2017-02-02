class ApplicantsController < ApplicationController
  def new
    @applicant = ShopperApplicant.new
  end

  def create
    @applicant = ShopperApplicant.new(applicant_params)

    if @applicant.save
      redirect_to complete_applicants_path
    else
      render :new
    end
  end

  def complete
  end


  private

  def applicant_params
    params.require(:shopper_applicant).permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :zip_code
    )
  end
end
