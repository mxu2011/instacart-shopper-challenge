class CreateApplicationSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :application_steps do |t|
      t.integer :funnel_id, null: false
      t.integer :shopper_applicant_id, null: false

      t.timestamps
    end

    add_index :application_steps, [:funnel_id, :shopper_applicant_id], unique: true
  end
end
