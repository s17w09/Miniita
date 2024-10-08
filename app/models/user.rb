# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commentfavorites, dependent: :destroy
  has_many :authentications, dependent: :destroy #外部認証用のテーブル

  # 通知を送ったユーザーへの通知
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy

  # 通知を受け取ったユーザーへの通知
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  accepts_nested_attributes_for :authentications
  has_one :profile

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, uniqueness: true, presence: true

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # userモデルのカラムが使えるよう指定
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at crypted_password email id id_value name salt updated_at]
  end

  # title_or_body_cont追加時に追加
  def self.ransackable_associations(_auth_object = nil)
    %w[articles favorites]
  end
end
