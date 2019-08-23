puts "Cleaning database..."

Deal.destroy_all
Record.destroy_all
Preference.destroy_all
User.destroy_all
Track.destroy_all
Release.destroy_all
Genre.destroy_all

puts "Database cleaned..."
