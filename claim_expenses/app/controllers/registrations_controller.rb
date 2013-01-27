class RegistrationsController < Devise::RegistrationsController


  def new
    logger.info "******* Rendering **************"
    super
  end
  
  def create
    logger.info "Registration: create action"
    super
  end
  
   protected

  def after_sign_up_path_for(resource)
    logger.info resource.inspect
    logger.info "*******After sign up ********"
  end
  
  def after_inactive_sign_up_path_for(resource)
    logger.info resource.inspect
    logger.info "******* after first inactive sign up *******"
    redirect_to [:expenses]
  end
  
end
