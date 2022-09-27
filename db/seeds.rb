# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Clearing db..."
Planet.destroy_all
Scientist.destroy_all
Mission.destroy_all

Faker::TvShows::StarTrek.unique.clear
Faker::Space.unique.clear
Faker::TvShows::Buffy.unique.clear

puts "Making planets..."
20.times {Planet.create(name: Faker::TvShows::StarTrek.unique.location,
                        distance_from_earth: Faker::Space.unique.distance_measurement,
                        nearest_star: Faker::Space.star,
                        image: "planet#{rand(1..10)}")}

puts "Making scientists..."                        
15.times {Scientist.create(name: Faker::FunnyName.name,
                           field_of_study: Faker::Educator.subject,
                           avatar: Faker::Avatar.image(size: "200x200", set: "set3"))}
# s1 = Scientist.create(name: "", field_of_study: "", avatar: "a")
# s2 = Scientist.create(name: "", field_of_study: "", avatar: "a")
# s3 = Scientist.create(name: "", field_of_study: "", avatar: "a")
# s4 = Scientist.create(name: "", field_of_study: "", avatar: "a")
# s5 = Scientist.create(name: "", field_of_study: "", avatar: "a")
# s6 = Scientist.create(name: "", field_of_study: "", avatar: "a")
# s7 = Scientist.create(name: "", field_of_study: "", avatar: "a")
puts "Making missions..."                           
20.times {Mission.create(name: Faker::TvShows::Buffy.unique.episode,
                         scientist: Scientist.all.sample, 
                         planet: Planet.all.sample)}

# Mission.create(name: "M1", scientist_id: s1.id, planet_id: )
# Mission.create(name: "M2", scientist_id: .id, planet_id: )
# Mission.create(name: "M3", scientist_id: .id, planet_id: )
# Mission.create(name: "M4", scientist_id: .id, planet_id: )
# Mission.create(name: "M5", scientist_id: .id, planet_id: )
# Mission.create(name: "M6", scientist_id: .id, planet_id: )
# Mission.create(name: "M7", scientist_id: .id, planet_id: )
# Mission.create(name: "M8", scientist_id: .id, planet_id: )
# Mission.create(name: "M9", scientist_id: .id, planet_id: )

puts "Done seeding!"                         