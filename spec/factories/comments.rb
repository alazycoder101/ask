# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    association :commentable, factory: :question
    sequence(:comment) { |n| "My comment Body:  #{n}" }
  end
end
