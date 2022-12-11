require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:question) }

  describe 'commentable' do
    let(:answer) { create(:answer) }

    it 'has comments' do
      answer.comments.create(title: 'first')
      expect(answer.comments.size).to eq(1)
    end
  end

  describe 'votable' do
    let(:answer) { create(:answer) }
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    it 'has votes' do
      answer.liked_by(user1)
      answer.downvote_from(user2)
      expect(answer.votes_for.size).to eq(2)
      expect(answer.get_likes.size).to eq(1)
      expect(answer.get_dislikes.size).to eq(1)
    end
  end
end
