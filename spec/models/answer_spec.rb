require 'rails_helper'
require "models/concerns/commentable_spec"

RSpec.describe Answer, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:question) }

  it_behaves_like "commentable"
end
