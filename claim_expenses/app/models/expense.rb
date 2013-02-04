class Expense < ActiveRecord::Base

  # => Associations
  belongs_to :user
  belongs_to :expense_category

  validates :item_name, :item_price, :expense_category_id,   :presence => true
  validates_numericality_of :item_price

end
