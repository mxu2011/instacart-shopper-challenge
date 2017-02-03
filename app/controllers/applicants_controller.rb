class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!, only: [:show, :edit, :update, :complete, :accept]
  before_action :set_applicant, only: [:show, :edit, :update, :complete, :accept]

  def show
  end

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
  end

  def update
    if @applicant.update(applicant_params)
      redirect_to applicants_path
    else
      render :edit
    end
  end

  def complete
  end

  def accept
    @applicant.background_check_accepted = true
    @applicant.save

    redirect_to applicants_path
  end


  private

  def set_applicant
    @applicant = current_applicant
  end

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
