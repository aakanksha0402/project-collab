module ApplicationHelper
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end

    flash_messages.join("\n").html_safe
  end

  def devise_error_messages_rails
    flash_messages = []
    type = "error"
    message = resource.errors.full_messages.first
    message = message.gsub("''", ':') if message

    text = "<script>toastr.#{type}('#{message}');</script>"
    flash_messages << text.html_safe if message

    flash_messages.join("\n").html_safe
  end

  def custom_flash(messages)
    messages.join("\n").html_safe
  end

  def alert_box(text, type, close = true)
    row = text.html_safe
    content_tag :div, row, class: "alert #{type}", data: {alert: ''}
  end

  def show_errors_for(object)
    content_for(:errors, object.errors.full_messages.map { |m| "#{m}."}.join('<br>').html_safe)
  end
end
