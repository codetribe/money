class Sheet < ActiveRecord::Base
  belongs_to :sheet
  has_many :sheets
  has_many :records
  attr_accessible :currency, :name, :sheet_id
  validates :currency, :name, presence: true
  
  def income
    records.where(pending: false, income: true).sum(:amount)
  end
  
  def expense
    records.where(pending: false, income: false).sum(:amount)
  end
  
  def pending_income
    records.where(pending: true, income: true).sum(:amount)
  end
  
  def pending_expense
    records.where(pending: true, income: false).sum(:amount)
  end
  
  def balance
    income - expense
  end
end
