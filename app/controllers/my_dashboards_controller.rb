class MyDashboardsController < ApplicationController
  def index
    @article_published = current_user.articles.published
    @article_title = current_user.articles.published.pluck(:title)
    @article_body_count = current_user.articles.published.sum { |article| article.body.length }
    @article_favorite = current_user.articles.joins(:favorites)

    @user_input = params[:user_input]
    return if @user_input.blank?

    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: 'gpt-4o-mini', # 必要なモデルを指定
        messages: [
          { role: 'system',
            content: 'あなたは優秀なWEBエンジニアです。ユーザー入力に応答してください。max_tokensを1000で設定しているので、tokenを1000以内で文章を収めてください。' },
          { role: 'user', content: @user_input }
        ],
        temperature: 0.7,
        max_tokens: 1000 # 平均でひらがな１文字１～２トークン、漢字１文字２～３トークンのため、日本語300文字程度と考え600に設定
      }
    )

    @text = response.dig('choices', 0, 'message', 'content')
    markdown_html = render_markdown(@text) # マークダウンをHTMLに変換
    render json: { text: markdown_html }
  end
end
