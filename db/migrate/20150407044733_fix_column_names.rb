class FixColumnNames < ActiveRecord::Migration
  def change
    rename_column :procedures, :DRG, :drg
  end
end
