class ExpenseCategory < ActiveRecord::Base
  
  validates :name, :uniqueness => true, 
                   :presence => true
  
  attr_accessible :name
  
end
