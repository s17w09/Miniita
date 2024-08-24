require 'rails_helper' #ヘルパーの読み込み

RSpec.describe User, type: :model do 
  describe 'validation check' do
    it 'is valid with a name, email, password and password_confirmation' do 
      user = User.new(
        name:     "hogehoge",
        email:    "hoge@hoge.com",
        password: "hogehoge",
        password_confirmation: "hogehoge"
      )
      expect(user).to be_valid 
    end

      it 'is invalid without a name' do
        user = User.new(
          name:     nil,
          email:    "hoge@hoge.com",
          password: "hogehoge",
          password_confirmation: "hogehoge"
        )
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
    
      it 'is invalid without a email' do
        user = User.new(
          name:     "hogehoge",
          email:    nil,
          password: "hogehoge",
          password_confirmation: "hogehoge"
        )
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it 'is invalid without a password' do
        user = User.new(
          name:     "hogehoge",
          email:    "hoge@hoge.com",
          password: nil,
          password_confirmation: "hogehoge"
        )
        user.valid?
        expect(user.errors[:password]).to include("は8文字以上で入力してください")
      end

      it 'is invalid without a password_confirmation' do
        user = User.new(
          name:     "hogehoge",
          email:    "hoge@hoge.com",
          password: "hogehoge",
          password_confirmation: nil
        )
        user.valid?
        expect(user.errors[:password_confirmation]).to include("を入力してください")
      end

      it 'is invalid without a password' do
        user = User.new(
          name:     "hogehoge",
          email:    "hoge@hoge.com",
          password: "hoge",
          password_confirmation: "hoge"
        )
        user.valid?
        expect(user.errors[:password]).to include("は8文字以上で入力してください")
      end
    end
end
