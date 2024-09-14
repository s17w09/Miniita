# frozen_string_literal: true
#外部認証用のテーブル
class Authentication < ApplicationRecord
  belongs_to :user
end
