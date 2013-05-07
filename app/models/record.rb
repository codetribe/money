class Record < ActiveRecord::Base
  attr_accessible :amount, :description, :income, :pending, :sheet_id, :time
  validates :amount, :description, presence: true
  belongs_to :sheet
  
  def type
    string = income ? "Income" : "Expense"
    string = "Pending " + string if pending
    string
  end
end
