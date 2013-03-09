module ApplicationHelper

  def flash_message
    if flash.any?
      message, klass = (flash[:alert] || flash[:error]) ? [(flash[:alert]|| flash[:error]), 'alert-error'] : [(flash[:success]|| flash[:notice]), 'alert-success']
    end
    if message
      content_tag(:div, message, :class => klass << ' alert span10 mt-medium').html_safe
    end
  end
end
