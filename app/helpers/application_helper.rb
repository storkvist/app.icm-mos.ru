module ApplicationHelper
  def icon(name, options = {})
    options[:class] ||= ''
    options[:style] ||= :solid

    content_tag(:span, class: "icon #{options[:class]}", title: options[:title]) do
      content_tag(:i, nil, class: "fa#{options[:style].to_s[0]} fa-#{name}")
    end
  end
end
