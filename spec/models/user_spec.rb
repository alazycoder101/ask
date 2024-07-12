require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:email).of_type(:string) }

  describe '#follow' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    it 'follow' do
      user1.follow(user2)

      expect(user1.follow?(user2)).to eq(true)
    end
  end

  describe '#follow?' do
    let(:user) { create(:user) }
    let(:topic) { create(:topic) }

    it 'does not follow' do
      expect(user.follow?(topic)).to eq(false)
    end

    it 'does follow' do
      user.follow(topic)
      expect(user.follow?(topic)).to eq(true)
    end
  end

  describe '#following_users' do
    let(:user) { create(:user) }
    let(:user1) { create(:user) }

    it 'does not follow' do
      expect(user.following_users.count).to eq(0)
    end

    it 'does follow' do
      user.follow(user1)

      expect(user.following_users.count).to eq(1)
    end
  end

  describe '#following_topics' do
    let(:user) { create(:user) }
    let(:topic) { create(:topic) }

    it 'does not follow' do
      expect(user.following_topics.count).to eq(0)
    end

    it 'does follow' do
      user.follow(topic)

      expect(user.following_topics.count).to eq(1)
    end
  end

  describe '#following_questions' do
    let(:user) { create(:user) }
    let(:question) { create(:question) }

    it 'does not follow' do
      expect(user.following_questions.count).to eq(0)
    end

    it 'does follow' do
      user.follow(question)

      expect(user.following_questions.count).to eq(1)
    end
  end

  describe '#unfollow' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    before do
      expect(user1.follow?(user2)).to be_falsy
      user1.follow(user2)
      expect(user1.follow?(user2)).to be_truthy
    end

    it 'does unfollow' do
      user1.unfollow(user2)

      expect(user1.follow?(user2)).to be_falsy
    end
  end

>>>>>>> feat/quora
end
