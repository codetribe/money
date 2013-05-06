class Sheet < ActiveRecord::Base
  belongs_to :sheet
  attr_accessible :currency, :name
end
