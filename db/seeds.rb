# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker' 


Instrument.destroy_all
User.destroy_all

# 5.times do 
#   user = User.new(
#   email: Faker::Internet.email,
#   password: Faker::Internet.password
#   ).save!
  3.times do 
    instrument = Instrument.new(
    name: Faker::Music.instrument,
    price: Faker::Number.number(digits: 4),
    description: Faker::Lorem.paragraph(sentence_count: 2)
    )
    instrument.user = User.new(
      email: Faker::Internet.email,
      password: Faker::Internet.password
      )
    instrument.save!
  end
# end

# 3.times do Instrument.new(
#   name: Faker::Music.instrument,
#   price: Faker::Number.number(digits: 4),
#   description: Faker::Lorem.paragraph(sentence_count: 2)
#   ).save!
# end

# 3.times do
#   Order.new().save!
# end
