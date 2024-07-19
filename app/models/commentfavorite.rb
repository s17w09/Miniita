# frozen_string_literal: true

class Commentfavorite < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates :comment_id, uniqueness: { scope: :user_id }
end
