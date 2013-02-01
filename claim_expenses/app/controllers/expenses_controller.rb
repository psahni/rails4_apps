class ExpensesController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @expense = Expense.new
  end  
  
end
