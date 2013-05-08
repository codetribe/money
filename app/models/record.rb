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
  
  def typenum=num
    self.income = (num ^ 1) > 0
    self.pending = (num ^ 2) > 0
  end

  def typenum
    number = 0
    number += self.income ? 1 : 0
    number += self.pending ? 2 : 0
    number
  end
end
