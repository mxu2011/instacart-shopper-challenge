class CreateShopperApplicants < ActiveRecord::Migration[5.0]
  def change
    create_table :shopper_applicants do |t|
      t.string :first_name,   null: false
      t.string :last_name,    null: false
      t.string :email,        null: false
      t.string :phone_number, null: false
      t.string :zip_code,     null: false

      t.timestamps
    end
  end
end
