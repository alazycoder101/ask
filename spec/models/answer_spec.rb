require 'rails_helper'
require "models/concerns/reviewable_spec"

RSpec.describe Answer, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:question) }

  it_behaves_like "commentable"

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

  describe 'after_create' do
    let(:user) { create(:user) }
    let(:answer) { create(:answer) }
    let(:question) { answer.question }
    let(:user) { answer.question }

    before do
      expect(question.answers_count).to eq (1)
    end

    it 'increases count' do
      Answer.create!(user_id: user.id, question_id: question.id, body: 'answer')

      expect(question.reload.answers_count).to eq (2)
    end
  end
end
