module ApplicationHelper

  def notice_message
    alert_types = { notice: :success, alert: :danger }

    close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

    return alerts.join("\n").html_safe
  end

  def link_or_title(title, length, need_link, link)
    title = truncate(title, length: length)
    if need_link
      return link_to(title, link)
    else
      return title
    end
  end

  def strftime(datetime)
    return datetime && datetime.class == ActiveSupport::TimeWithZone ? datetime.strftime('%F %R 星期%w') : ""
  end

  def currency(price)
    return content_tag :span, number_to_currency(price, precision: 0), class: (price < 0 ? "red" : "")
  end

end
