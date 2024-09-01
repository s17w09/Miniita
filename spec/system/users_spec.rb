require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in '名前', with: 'hogehoge'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード(8文字以上/半角の英数字のみ)', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content '新規登録が完了しました。'
          expect(current_path).to eq articles_path
        end
      end

      context '名前が未入力' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in '名前', with: ' '
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード(8文字以上/半角の英数字のみ)', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(current_path).to eq new_user_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in '名前', with: 'hogehoge'
          fill_in 'メールアドレス', with: ' '
          fill_in 'パスワード(8文字以上/半角の英数字のみ)', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(current_path).to eq new_user_path
        end
      end

      context 'パスワードが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in '名前', with: 'hogehoge'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード(8文字以上/半角の英数字のみ)', with: ' '
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(current_path).to eq new_user_path
        end
      end

      context 'パスワード確認が未入力' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in '名前', with: 'hogehoge'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード(8文字以上/半角の英数字のみ)', with: 'password'
          fill_in 'パスワード確認', with: ' '
          click_button '登録'
          expect(current_path).to eq new_user_path
        end
      end

      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in '名前', with: 'hogehoge'
          fill_in 'メールアドレス', with: existed_user.email
          fill_in 'パスワード(8文字以上/半角の英数字のみ)', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content '新規登録に失敗しました。'
          expect(page).to have_content 'メールアドレスはすでに存在します'
          expect(current_path).to eq new_user_path
          expect(page).to have_field 'メールアドレス', with: existed_user.email
        end
      end
    end
  end
end