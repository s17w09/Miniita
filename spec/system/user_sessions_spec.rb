require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let(:user) { create(:user) }

describe 'ログイン前' do
  context 'フォームの入力値が正常' do
    it 'ログイン処理が成功する' do
      visit login_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      expect(current_path).to eq login_path
    end
  end

  context 'フォームが未入力' do
    it 'ログイン処理が失敗する' do
      visit login_path
      fill_in 'メールアドレス', with: ' '
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      expect(current_path).to eq login_path
    end
  end
end
end