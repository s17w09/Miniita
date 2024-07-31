# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

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

  # 記事へのいいね登録
  def favorited?(user, type)
    favorites.exists?(user_id: user.id, favorite_type: type)
  end

  # 記事へのいいね解除
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

  def create_notification_like!(current_user)
    # すでにいいねされているかの確認
    temp = Notification.where(['visitor_id = ? and visited_id = ? and article_id = ? and action = ?', current_user.id,
                               user_id, id, 'like'])

    # いいねされていない場合のみ、通知レコードを作成
    return if temp.present?

    notification = current_user.active_notifications.new(
      article_id: id,
      visited_id: user_id,
      action: 'like'
    )

    # 自分の投稿に対するいいねは、通知済みにする
    notification.checked == true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
