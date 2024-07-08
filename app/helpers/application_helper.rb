module ApplicationHelper
  def page_title(title = "")
    base_ttitle = "Miniita"
    if title.empty?
      base_ttitle
    else
       "#{title} | #{base_ttitle}"
    end
  end

  def render_markdown(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
