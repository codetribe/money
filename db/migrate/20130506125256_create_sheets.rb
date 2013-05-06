class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :name
      t.string :currency
      t.references :sheet

      t.timestamps
    end
    add_index :sheets, :sheet_id
  end
end
