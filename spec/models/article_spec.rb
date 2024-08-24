require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validation check' do
    it 'is valid with title and body' do 
      user = User.create(email: "hoge@hoge.com", password: "hogehoge")
      article = user.articles.new(title: "hogehoge", body: "hogehoge")
      expect(article).to be_valid
      expect(article.errors).to be_empty
    end

    it 'is invalid without a title' do
      article = Article.new(
        title: nil,
        body: "hogehoge"
      )
      article.valid?
      expect(article.errors[:title]).to include("を入力してください")
    end

    it 'is invalid without a body' do
      article = Article.new(
        title: "hogehoge",
        body: nil
      )
      article.valid?
      expect(article.errors[:body]).to include("を入力してください")
    end
  end
end
