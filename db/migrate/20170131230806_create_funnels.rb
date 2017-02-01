class CreateFunnels < ActiveRecord::Migration[5.0]
  def change
    create_table :funnels do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :funnels, :name, unique: true
  end
end
