class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!, only: [:edit, :update, :complete, :accept]

  def new
    @applicant = ShopperApplicant.new
  end

  def create
    @applicant = ShopperApplicant.new(applicant_params)

    if @applicant.save
      sign_in(@applicant)
      redirect_to complete_applicants_path
    else
      render :new
    end
  end

  def edit
    @applicant = current_applicant
  end

  def update
    @applicant = current_applicant

    if @applicant.update(applicant_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def complete
  end

  def accept
    @applicant = current_applicant
    @applicant.background_check_accepted = true
    @applicant.save

    redirect_to root_path
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
