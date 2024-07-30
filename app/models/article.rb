# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  # 記事の状態（下書きor投稿済）のステータス
  enum status: { draft: 0, published: 1 }

  # 記事のソート機能のスコープ
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }

  def created_by?(user)
    true if user_id == user.id
  end

  def favorited?(user, type)
    favorites.exists?(user_id: user.id, favorite_type: type)
  end

  def unfavorited?(user, type)
    favorites.where(user_id: user.id, favorite_type: type).empty?
  end

  # name_cont追加時に追加
  def self.ransackable_attributes(_auth_object = nil)
    %w[body created_at id id_value title updated_at user_id]
  end

  # name_cont追加時に追加
  def self.ransackable_associations(_auth_object = nil)
    %w[favorites user]
  end
end
