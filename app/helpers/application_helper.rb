# frozen_string_literal: true

module ApplicationHelper
  def page_title(title = '')
    base_ttitle = 'Miniita'
    if title.empty?
      base_ttitle
    else
      "#{title} | #{base_ttitle}"
    end
  end

  def render_markdown(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end

  def flash_background_color(type)
    case type.to_sym
    when :notice then 'bg-green-500'
    when :alert  then 'bg-red-500'
    when :error  then 'bg-yellow-500'
    else 'bg-gray-500'
    end
  end
end
