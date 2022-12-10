require 'rails_helper'
require "models/concerns/commentable_spec"

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:topics) }
  it { is_expected.to have_many(:answers) }

  it_behaves_like "commentable"
end
