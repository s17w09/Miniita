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
end
