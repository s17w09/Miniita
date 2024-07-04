class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commentfavorites, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, uniqueness: true, presence: true

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # userモデルのカラムが使えるよう指定
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "crypted_password", "email", "id", "id_value", "name", "salt", "updated_at"]
  end

  # title_or_body_cont追加時に追加
  def self.ransackable_associations(auth_object = nil)
    ["articles", "favorites"]
  end
end
