class AddBackgroundCheckAcceptedAtToShopperApplicants < ActiveRecord::Migration[5.0]
  def change
    add_column :shopper_applicants, :background_check_accepted_at, :datetime
  end
end
