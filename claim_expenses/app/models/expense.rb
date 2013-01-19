class Expense < ActiveRecord::Base

  # => Associations
  belongs_to :user
  belongs_to :expense_category
  
end
