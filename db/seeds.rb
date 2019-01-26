# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  email: 'admin@gmail.com',
  password: 'adminadmin',
  password_confirmation: 'adminadmin'
)
user.save!
user.add_role :admin

user = User.new(
  email: 'user@gmail.com',
  password: 'useruser',
  password_confirmation: 'useruser'
)

user.save!

product = Product.new(
  price: 100,
  name: 'cat'
)

product.images.attach(io: File.open('test/fixtures/files/cat.jpg'), filename: 'cat.jpg')
product.save!

product = Product.new(
  price: 9999,
  name: 'meme'
)

product.images.attach(io: File.open('test/fixtures/files/explosion.jpg'), filename: 'explosion.jpg')
product.images.attach(io: File.open('test/fixtures/files/scare.jpg'), filename: 'scare.jpg')
product.save!
