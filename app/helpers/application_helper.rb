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
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <h4>#{sentence}</h4>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

  def alert_box(text, type, close = true)
    row = text.html_safe
    content_tag :div, row, class: "alert #{type}", data: {alert: ''}
  end

  def show_errors_for(object)
    content_for(:errors, object.errors.full_messages.map { |m| "#{m}."}.join('<br>').html_safe)
  end
end
