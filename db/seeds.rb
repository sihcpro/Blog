# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Created Admin' if User.new(user_name: "Bang", email: "equal@gmail.com", password: "123456", gender: 0, role: 2, created_at: Time.now).save
puts 'created Test'  if User.new(user_name: "Test", email: "a@b.c", password: "123456").save


