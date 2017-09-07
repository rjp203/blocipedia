# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Wikis
25.times do
  Wiki.create!(
    title:   Faker::Seinfeld.quote,
    body:    Faker::Seinfeld.quote,
    private: false,
    user_id: Faker::Number.between(0,100) 
  )
end
 
wikis = Wiki.all

#Create Users
5.times do
  User.create!(
    firstname:  Faker::Name.unique.first_name,
    lastname:   Faker::Name.unique.last_name,
    email:      Faker::Internet.unique.email,
    password:   Faker::StarWars.vehicle,
    role:       Faker::Number.between(0,2) 
  )
end

users = User.all
 
puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"