class Record < ActiveRecord::Base
  attr_accessible :amount, :description, :income, :pending
end
