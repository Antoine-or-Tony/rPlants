# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "reset seed database"
User.destroy_all
Plant.destroy_all
Booking.destroy_all

p "generate new seed"
julien = User.new(username: "julien-du-93",
                  firstname: "julien",
                  lastname: "lalou")
julien.save

begonia = Plant.new(name: "beau begonia",
                    price: 10,
                    disponibility: true,
                    species: "maman")
begonia.user = julien
begonia.save!
