class ExpensesController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @expense = Expense.new
  end  
  
  def create
  end
  
  def destory
  end
  
  def edit
  end
  
end
