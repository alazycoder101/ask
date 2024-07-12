# frozen_string_literal: true

FactoryBot.define do
  factory :topic do
    sequence(:name) { |n| "topic #{n}" }
    sequence(:description) { |n| "topic description #{n}" }
  end
end
