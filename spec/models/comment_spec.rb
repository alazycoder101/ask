require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to have_db_column(:commentable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:commentable_type).of_type(:string) }

  it { is_expected.to belong_to(:commentable) }

  describe 'after_create' do
    let(:user) { create(:user) }
    let(:comment) { create(:comment) }
    let(:question) { comment.commentable }

    before do
      expect(question.comments_count).to eq (1)
    end

    it 'increases count' do
      question.comments.create(user_id: user.id, comment: 'my comment')

      expect(question.reload.comments_count).to eq (2)
    end
  end
end
