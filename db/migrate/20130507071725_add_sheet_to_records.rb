class AddSheetToRecords < ActiveRecord::Migration
  def change
    add_column :records, :sheet_id, :integer
    add_index :records, :sheet_id
  end
end
