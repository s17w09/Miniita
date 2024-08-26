require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation check' do
    it 'is invalid without a body' do
      comment = Comment.new(
        body: nil
      )
      comment.valid?
      expect(comment.errors[:body]).to include("を入力してください")
    end
  end
end
