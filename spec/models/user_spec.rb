require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:questions) }
  it { is_expected.to have_many(:comments) }

  describe 'search' do
  end
end
