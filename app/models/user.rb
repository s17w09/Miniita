# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commentfavorites, dependent: :destroy
  has_many :authentications, dependent: :destroy

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

  def first_published
    articles.count >= 1
  end

  def third_published
    articles.count >= 3
  end
    
  def fifth_published
    articles.count >= 5
  end

  def tenth_published
    articles.count >= 10
  end

  def twentieth_published
    articles.count >= 20
  end

  def thirtieth_published
    articles.count >= 30
  end
end
