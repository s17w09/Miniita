require 'rails_helper'


RSpec.describe 'Articles', type: :system do
  include LoginMacros
  # FactoryBotを使用してテストを準備している
  let(:user) { create(:user) }
  let(:article) { create(:article, user: user, title: 'hogehoge', body: 'hogehoge') }

  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context '記事の詳細ページにアクセス' do
        it '記事の詳細情報が表示される' do
          visit article_path(article)
          expect(page).to have_text article.title
          expect(page).to have_text article.created_at.strftime('%Y/%m/%d %H:%M')
          expect(page).to have_text article.updated_at.strftime('%Y/%m/%d %H:%M')
          expect(page).to have_text article.user.name
          expect(page).to have_text article.body
          expect(current_path).to eq article_path(article)
        end
      end
    end
  end

  xdescribe 'ログイン後' do
    before { login_as(user) }

    describe '記事の作成' do
      context 'フォームの入力値が正常' do
        it '記事の新規作成が成功する' do
          visit new_article_path
          fill_in 'タイトル', with: 'タイトルです。'
          fill_in '本文', with: 'hogehoge'
          click_button '投稿'
          expect(page).to have_content 'タイトル: hogehoge'
          expect(page).to have_content '本文: hogehoge'
          expect(current_path).to eq '/articles/new'
        end
      end

      context 'タイトルが未入力' do
        it 'タスクの新規作成が失敗する' do
          visit new_article_path
          fill_in 'タイトル', with: ' '
          fill_in '本文', with: 'hogehoge'
          click_button '投稿'
          expect(page).to have_content 'タイトルと本文を入力しないと、投稿できません。'
          expect(page).to have_content 'タイトルを入力してください'
          expect(current_path).to eq new_article_path
        end
      end
  end
end
end
