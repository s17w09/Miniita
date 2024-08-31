require 'rails_helper'

RSpec.describe Commentfavorite, type: :model do
  subject { FactoryBot.build(:commentfavorite) }

  it { is_expected.to validate_uniqueness_of(:comment_id).scoped_to(:user_id) }
end
