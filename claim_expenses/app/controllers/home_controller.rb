class HomeController < ApplicationController
  
  before_filter :not_signed_in
  
  def index
    redirect_to expenses_path
  end
  
  def after_sign_out_path
    flash[:success] = "Successfully signed out"
  end

end
