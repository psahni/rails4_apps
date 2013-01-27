class HomeController < ApplicationController
  def index
    redirect_to expenses_path
  end
  
  def after_sign_out_path
  end
end
