class AddWeekIndexToShopperApplicants < ActiveRecord::Migration[5.0]
  def change
    add_index :shopper_applicants, :created_at
    add_index :shopper_applicants, 'date_trunc(\'week\', created_at)',
      name: "index_shopper_applicants_on_created_at_by_week"
  end
end
