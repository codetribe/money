class Record < ActiveRecord::Base
  Income = 1
  Expense = 0
  Pending_income = 3
  Pending_expense = 2
  
  attr_accessible :amount, :description, :income, :pending, :sheet_id, :time
  validates :amount, :description, presence: true
  belongs_to :sheet
  
  def type
    string = income ? "Income" : "Expense"
    string = "Pending " + string if pending
    string
  end
  
  def type=num
    self.income = num ^ 1
    self.pending = num ^ 2
  end
end
