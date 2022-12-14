require 'rails_helper'
require "models/concerns/commentable_spec"

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:topics) }
  it { is_expected.to have_many(:answers) }

  it_behaves_like "commentable"

  let (:question) { create(:question, topics: [ create(:topic) ]) }
  describe 'topics' do
    it 'return array' do
      expect(question.topics.count).to eq(1)
    end
  end

  describe 'commentable' do
    let(:question) { create(:question) }

    it 'has comments' do
      question.comments.create(title: 'first')
      expect(question.comments.size).to eq(1)
    end
  end

  describe 'view!' do
    let(:question) { create(:question) }

    before do
      expect(question.views_count).to eq(0)
    end

    it 'increase views_count' do
      question.view!
      expect(question.views_count).to eq(1)
    end
  end
end
