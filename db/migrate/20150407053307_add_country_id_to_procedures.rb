class AddCountryIdToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :country_id, :integer
  end
end
