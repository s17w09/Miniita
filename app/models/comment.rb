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

  def create_notification_comment!(current_user, comment_id)
    # 自分以外で、記事にコメントしている人にも通知を送る
    temp_ids = Comment.select(:user_id).where(article_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if tenp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントを複数回した場合に、1つの投稿に複数回きちんと通知する
    notification = current_user.active_notifications.new(
      article_id: id,
      comment_id:,
      visited_id:,
      action: 'comment'
    )

    # 自分の投稿に対するコメントは、通知済みにする
    notification.checked == true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
