# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    user
    sequence(:title) { |n| "My Question #{n}" }
    sequence(:body) { |n| "My Question Body:  #{n}" }
  end
end
