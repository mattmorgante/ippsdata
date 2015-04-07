class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :DRG
      t.string :State
      t.integer :Discharges
      t.float :Average_Charges
      t.float :Average_Total_Payments
      t.float :Average_Medicare_Payments

      t.timestamps null: false
    end
  end
end
