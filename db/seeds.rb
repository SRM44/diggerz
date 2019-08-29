puts "Cleaning database..."

Deal.destroy_all
Record.destroy_all
Preference.destroy_all
User.destroy_all
Track.destroy_all
Release.destroy_all
Genre.destroy_all

puts "Create Genres..."

electronic          = Genre.create!(name: "Electronic")
funk_soul           = Genre.create!(name: "Funk / Soul")
pop                 = Genre.create!(name: "Pop")
rock                = Genre.create!(name: "Rock")
reggae              = Genre.create!(name: "Reggae")
jazz                = Genre.create!(name: "Jazz")
latin               = Genre.create!(name: "Latin")
folk_world_country  = Genre.create!(name: "Folk, World, & Country")
stage_screen        = Genre.create!(name: "Stage & Screen")
blues               = Genre.create!(name: "Blues")
non_music           = Genre.create!(name: "Non-Music")
classical           = Genre.create!(name: "Classical")
children_s          = Genre.create!(name: "Children's")
brass_military      = Genre.create!(name: "Brass & Military")

puts "Create Users..."

puts "Finished!"


