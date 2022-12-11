# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    user
    question
    sequence(:body) { |n| "My Answer Body:  #{n}" }
  end
end
