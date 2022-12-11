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
end
