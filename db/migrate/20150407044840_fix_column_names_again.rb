class FixColumnNamesAgain < ActiveRecord::Migration
  def change
    rename_column :procedures, :State, :state
    rename_column :procedures, :Discharges, :discharges
    rename_column :procedures, :Average_Charges, :average_charges
    rename_column :procedures, :Average_Total_Payments, :average_total_payments
    rename_column :procedures, :Average_Medicare_Payments, :average_medicare_payments
  end
end
