class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def after_sign_in_path_for(resource)
    Rails.logger.info "*********************************"
    Rails.logger.info resource.inspect
    Rails.logger.info "*********************************"
    if resource.admin?
      admin_expenses_path
    else
      expenses_path
    end
  end

#  def after_sign_up_path_for(resource)
#    logger.info "You find me here man!!"
#     redirect_to expenses_path and return
#  end
#   

  def after_sign_out_path_for(resource_or_scope)
     after_sign_out_path_home_index_url
  end
  
  def admin_authenticate 
    authenticate_user!
  end
  
  def not_signed_in
    if current_user
      redirect_to after_sign_in_path_for(current_user) and return false
    end
  end
  
end

######################################################################
#http://stackoverflow.com/questions/6499589/devise-redirect-page-after-confirmation
#http://stackoverflow.com/questions/8234023/devise-after-sign-in-path-for-sending-to-root-path-query
# http://blog.devinterface.com/2011/05/two-step-signup-with-devise/
#http://edapx.com/2012/04/18/authorization-and-user-management-in-rails/ - can can and devise
######################################################################
