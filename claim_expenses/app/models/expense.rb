class Expense < ActiveRecord::Base

  MINIMUM = 1
  
  # => Associations
  belongs_to :user
  belongs_to :category

  validates :item_name, :item_price, :category_id,   :presence => true
  validates_numericality_of :item_price, :greater_than => MINIMUM

  attr_accessible :item_name,
                  :item_price,
                  :category_id
end
