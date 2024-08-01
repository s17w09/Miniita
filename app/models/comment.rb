# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :commentfavorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :body, presence: true

  def favorited?(user)
    commentfavorites.exists?(user_id: user.id)
  end

  def create_notification_commentlike!(current_user)
    # すでにコメントに、いいねされているかの確認
    temp = Notification.where(['visitor_id = ? and visited_id = ? and comment_id = ? and action = ?', current_user.id,
                               user_id, id, 'commentlike'])

    # 上記で確認したtempで、いいねされていない場合のみ通知レコードを作成
    return if temp.present?

    # 現在のユーザーで、相手に送る通知を作成する
    notification = current_user.active_notifications.new(
      comment_id: id,
      visited_id: user_id,
      action: 'commentlike'
    )

    # 自分の投稿に対するいいねは、通知済みにする
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
