class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :commentfavorites, dependent: :destroy

  validates :body, presence: true

  def favorited?(user)
    commentfavorites.where(user_id: user.id).exists?
  end
end
