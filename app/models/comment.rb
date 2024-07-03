class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article, optional: true

  validates :body, presence: true
end
