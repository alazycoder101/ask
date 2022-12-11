# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  password = ENV.fetch('TEST_PASSWORD', 'Test_1234')
  User.create!(email: 'user1@ask.com', login: 'user1', name: 'John', password: password,
               password_confirmation: password)
  User.create!(email: 'user2@ask.com', login: 'user2', name: 'Tom', password: password,
               password_confirmation: password)
  User.create!(email: 'user3@ask.com', login: 'user3', name: 'Jimmy', password: password,
               password_confirmation: password)
  User.create!(email: 'user4@ask.com', login: 'user4', name: 'Kate', password: password,
               password_confirmation: password)

  admin_password = ENV.fetch('ADMIN_PASSWORD', 'p@ssw0rd')
  AdminUser.create!(email: 'admin@ask.com', password: admin_password, password_confirmation: admin_password)
end

