class ExpensesController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @expense = Expense.new
  end  
  
  def create
    @expense = Expense.new(params[:expense])
    if @expense.save
      respond_to do |format|
        format.html{ redirect_to expenses_path }
        format.js{ render :json => { :expense => @expense.to_json, :notice => "Yay! Saved Successfully" },
                          :content_type => 'application/json', 
                          :layout => false, 
                          :status => :ok }
      end
    else
      respond_to do |format|
        format.html{ render :action => 'index' }
        format.js{   render :json => @expense.errors  }
      end
    end
  end
  
  def destory
  end
  
  def edit
  end
  
end
