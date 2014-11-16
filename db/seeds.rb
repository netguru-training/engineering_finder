# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

5.times do
  User.create firstname: Faker::Name.first_name, lastname: Faker::Name.last_name,
  email: Faker::Internet.email, admin: false, chosen_thesis_id: 1
end

5.times do
Thesis.create user_id: 1 , category_id: 1, title: Faker::Lorem.sentence,
participants_limit: rand(6)
end

5.times do
  Category.create name: Faker::Lorem.sentence
end

5.times do
  Review.create user_id: 1, thesis_id: 1, text: Faker::Lorem.sentence
end
