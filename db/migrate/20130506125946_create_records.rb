class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :description
      t.decimal :amount
      t.boolean :income
      t.boolean :pending

      t.timestamps
    end
  end
end
