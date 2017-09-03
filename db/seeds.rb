# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 require 'random_data'

 # Create Wikis
 50.times do
 # #1
   Wiki.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     private: true, 
     user_id: RandomData.random_number
   )
 end
 wikis = Wiki.all
 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"