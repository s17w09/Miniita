# frozen_string_literal: true

module Openai
  class OpenaisController < ApplicationController
    include ApplicationHelper

    def show; end

    def text
      @user_input = params[:user_input]

      return if @user_input.blank?

      client = OpenAI::Client.new

      response = client.chat(
        parameters: {
          model: 'gpt-4o-mini', # Required.
          messages: [
            { role: 'system', content: "あなたは優秀なWEBエンジニアです。初心者エンジニアでもわかるように、userの質問に回答してください。また、max_tokensを1000で設定しているので、tokenを1000以内で文章を収めてください。' },
        ユーザーから、「「」についてテンプレート化してください。」という文言とその一言が送信されたら、鉤括弧内の文言をもとに、初心者エンジニアでも書きやすい技術記事のテンプレートを、3~5項目で作成してください。
        ユーザーから、「「」について内容を正確に確認し、誤っていれば内容を指摘してください。」という文言とともに記事内容が送信されたら、鉤括弧内の内容をもとに、内容の正確性を確認し誤っていれば内容を指摘してください。
        ユーザーから、「「」について誤字脱字、文章構成を確認し、誤っていれば内容を指摘してください。」の内容とともに質問などが送られてきたら、鉤括弧内の内容をもとに、誤字脱字・文章構成を確認し誤っていれば内容を指摘してください。
        ユーザーから、上記以外の内容が送信されたら、その内容に正確に回答してください。
        " },
            { role: 'user', content: @user_input }
          ], # Required.
          temperature: 0.7,
          max_tokens: 1000 # 平均でひらがな１文字１～２トークン、漢字１文字２～３トークンのため、日本語300文字程度と考え600に設定
        }
      )

      @text = response.dig('choices', 0, 'message', 'content')
      markdown_html = render_markdown(@text) # マークダウンをHTMLに変換
      render json: { text: markdown_html }
    end
  end
end
