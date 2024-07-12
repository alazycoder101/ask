# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  puts 'seeding users ......'

  password = ENV.fetch('TEST_PASSWORD', 'p@ssw0rd')

  1.upto(5) do |i|
    User.create!(email: "user#{i}@ask.com", login: "user#{i}", name: Faker::Name.name, password: password,
               password_confirmation: password)
  end

  admin_password = ENV.fetch('ADMIN_PASSWORD', 'p@ssw0rd')
  AdminUser.create!(email: 'admin@ask.com', password: admin_password, password_confirmation: admin_password)

  puts "Please sign in with user1@ask.com with password `#{password}`"
  puts "Admin: Please sign in with admin@ask.com with password `#{password}`"
end

