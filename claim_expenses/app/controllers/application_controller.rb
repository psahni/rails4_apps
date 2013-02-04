class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
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

  def not_signed_in      # require visitor
    if current_user
      redirect_to after_sign_in_path_for(current_user) and return false
    end
  end

end
