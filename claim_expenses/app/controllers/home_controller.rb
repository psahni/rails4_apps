class HomeController < ApplicationController

  before_filter :not_signed_in, :except => :index

  def index
    if current_user
      redirect_to expenses_path and return
    else
      #debugger
      redirect_to sign_in_path and return
    end
  end

  def after_sign_out_path
    flash[:success] = "Successfully signed out"
  end

end
