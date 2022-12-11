require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:topics) }
  it { is_expected.to have_many(:answers) }

  let (:question) { create(:question, topics: [ create(:topic) ]) }
  describe 'topics' do
    it 'return array' do
      expect(question.topics.count).to eq(1)
    end
  end
end
