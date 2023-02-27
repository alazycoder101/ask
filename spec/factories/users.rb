# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    name { 'John' }
    sequence(:login) { |n| "john#{n}" }
  end
end
