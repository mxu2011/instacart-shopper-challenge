class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!, only: [:show, :edit, :update, :confirm, :accept]
  before_action :set_applicant, only: [:show, :edit, :update, :confirm, :accept]

  def show
  end

  def new
    @applicant = ShopperApplicant.new
  end

  def create
    @applicant = ShopperApplicant.new(applicant_params)

    if @applicant.save
      sign_in(@applicant)
      flash[:success] = "Application submitted!"
      redirect_to confirm_applicants_path
    else
      flash.now[:warning] = "Application could not be submitted!"
      render :new
    end
  end

  def edit
  end

  def update
    if @applicant.update(applicant_params)
      flash[:success] = "Application updated!"
      redirect_to applicants_path
    else
      flash.now[:warning] = "Application could not be updated!"
      render :edit
    end
  end

  def confirm
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
