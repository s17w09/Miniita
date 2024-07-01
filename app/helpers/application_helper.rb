module ApplicationHelper
  def render_markdown(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
