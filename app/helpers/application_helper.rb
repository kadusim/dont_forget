module ApplicationHelper

  def flash_message
    message_return = ""
    [:success, :error, :alert, :notice].each {|type|
      if flash[type]
        case type
        when :success
          message_return = create_message "success", flash[type]
        when :error
          message_return = create_message "danger", flash[type]
        when :alert
          message_return = create_message "warning", flash[type]
        when :notice
          message_return = create_message "info", flash[type]
        else
          message_return = create_message type, flash[type]
        end
      end
    }
    message_return.html_safe
  end

  private

  def create_message(type_bootstrap, message)
    messages = ""
    messages += "<div id=flash-messages class=\"alert alert-#{type_bootstrap}\">#{message}</div>"
    messages
  end

end
