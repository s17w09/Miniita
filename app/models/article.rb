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
    # すでにいいねされているかの確認（これを確認しないといいねの度に通知が入る）
    temp = Notification.where(['visitor_id = ? and visited_id = ? and article_id = ? and action = ?', current_user.id,
                               user_id, id, 'like'])

    # 上記で確認したtempで、いいねされていない場合のみ通知レコードを作成
    return if temp.present?

    # 現在のユーザーで、相手に送る通知を作成する
    notification = current_user.active_notifications.new(
      article_id: id,
      visited_id: user_id,
      action: 'like'
    )

    # 自分の投稿に対するいいねは、通知済みにする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外で、記事にコメントしている人にも通知を送る
    temp_ids = Comment.select(:user_id).where(article_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントを複数回した場合に、1つの投稿に複数回きちんと通知する
    notification = current_user.active_notifications.new(
      article_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )

    # 自分の投稿に対するコメントは、通知済みにする
    notification.checked == true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
