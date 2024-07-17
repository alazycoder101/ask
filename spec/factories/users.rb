# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    sequence(:name) { |n| "User name#{n}" }
    sequence(:login) { |n| "user#{n}" }
  end
end
