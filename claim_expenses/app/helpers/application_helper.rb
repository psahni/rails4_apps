module ApplicationHelper

  def flash_message
    if flash.any?
      message, klass = flash[:alert] ? [flash[:alert], 'alert-error'] : [flash[:success], 'alert-success']
    end
    if message
      content_tag(:div, message, :class => klass << ' alert span12 offset1 mt-medium').html_safe
    end
  end
end
