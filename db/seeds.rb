puts "Cleaning database..."

Deal.destroy_all
Record.destroy_all
Preference.destroy_all
User.destroy_all
Track.destroy_all
Release.destroy_all
Genre.destroy_all

puts "Create Users..."

yanis = User.create!(
  email: "yanis@example.com",
  password: "azerty",
  username: "Sinay",
  location: "Nantes",
  name: "Yanis",
  avatar: File.open(Rails.root.join('db/fixtures/users/yanis.jpg'))
)

volodia = User.create!(
  email: "volodia@example.com",
  password: "azerty",
  username: "Dzatoem",
  location: "Nantes",
  name: "Volodia",
  avatar: File.open(Rails.root.join('db/fixtures/users/volodia.jpg'))
)

amelie = User.create!(
  email: "amelie@gmail.com",
  username: "Amélie.C",
  location: "Nantes",
  password: "azerty",
  name: "Amelie",
  avatar: File.open(Rails.root.join('db/fixtures/users/amelie.jpg'))
)

steven = User.create!(
  email: "steven@example.com",
  password: "azerty",
  username: "YoupiMoriconi",
  location: "Nantes",
  name: "Steven",
  avatar: File.open(Rails.root.join('db/fixtures/users/steven.jpg'))
)

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

puts "Create Releases..."

 the_dark_side_of_the_moon  = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/the_dark_side_of_the_moon.jpg')),
  title: " The Dark Side Of The Moon",
  artist:  "Pink Floyd",
  label: "Harvest",
  year: "1973",
  genre: rock
)

nevermind = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/nirvana.jpg')),
  title: "Nevermind",
  artist: "Nirvana",
  label: "DGC",
  year: "1991",
  genre: rock
)

sgt_pepper_s_lonely_hearts_club = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/sgt_pepper_s_lonely_hearts_club.jpg')),
  title: "Sgt. Pepper's Lonely Hearts Club",
  artist: "The Beatles",
  label: "Parlophone",
  year: "1967",
  genre: rock
)

master_of_puppets  = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/master_of_puppets.jpg')),
  title: "Master Of Puppets",
  artist: "Metallica",
  label: "Elektra",
  year: "1986",
  genre: rock
)

rage_against_the_machine = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/rage_against_the_machine.jpg')),
  title: "Rage Against The Machine",
  artist: "Rage Against The Machine",
  label:  "Epic Associated",
  year: "1992",
  genre: rock
)

 machine_head  = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/machine_head.jpg')),
  title: "Machine Head ",
  artist: "Deep Purple ",
  label: "Purple Records",
  year: "1972",
  genre: rock
)

in_rainbows  = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/in_rainbows.jpg')),
  title: "In Rainbows",
  artist: "Radiohead",
  label: "XL Recordings",
  year: "2007",
  genre: rock
)

white_elephant = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/white_elephant.jpg')),
  title: "White Elephant",
  artist: "Bogdana Chivas",
  label: "Rivendale Records",
  year: "2018",
  genre: rock
)

 born_in_the_usa = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/born_in_the_usa.jpg')),
  title: "Born In The U.S.A",
  artist: "Bruce Springsteen",
  label: "CBS",
  year: "1984",
  genre: rock
)

tallulah = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/tallulah.jpg')),
  title: "Tallulah",
  artist: "Feeder",
  label: "Believe",
  year: "2019",
  genre: rock
)

the_great_herald_of_misery = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/the_great_herald_of_misery.jpg')),
  title: "The Great Herald of Misery",
  artist: "Heptaedium",
  label: "Apathia Records",
  year: "2019",
  genre: rock
)

hots_space = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/hot_space.jpg')),
  title: "Hot Space",
  artist: "Queen",
  label: "Virgin EMI Records",
  year: "2019",
  genre: rock
)

silver_bullet = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/silver_bullet.jpg')),
  title: "Silver Bullet",
  artist: "Tanya Montana Coe",
  label: "Thee Medea Complex",
  year: "2015",
  genre: rock
)

the_reverb_conspiracy_volume_six = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/the_reverb_conspiracy_volume_six.jpg')),
  title: "The Reverb Conspiracy Volume Six",
  artist: "Various",
  label: "Fuzz Club Records",
  year: "2019",
  genre: rock
)

homesick = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/homesick.jpg')),
  title: "Homesick",
  artist: "Shake Shake Go",
  label: "Beaucoup Music",
  year: "2018",
  genre: rock
)

loaded = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/loaded.jpg')),
  title: "Loaded",
  artist: "The Velvet Underground",
  label: "Atlantic",
  year: "1981",
  genre: rock
)

hot_rats = Release.create!(
  image: File.open(Rails.root.join('db/fixtures/releases/hot_rats.jpg')),
  title: "Hot Rats",
  artist: "Frank Zappa",
  label: "Reprise Records",
  year: "1979",
  genre: rock
)


puts "Create Tracks..."

track_white_elephant_A1 = Track.create!(
  title: "White Elephant",
  position: "A1",
  duration: "2:36",
  release: white_elephant
)

track_white_elephant_A2 = Track.create!(
  title: "Supermann",
  position: "A2",
  duration: "4:04",
  release: white_elephant
)

track_white_elephant_B1 = Track.create!(
  title: "White Elephant",
  position: "B1",
  duration: "2:36",
  release: white_elephant
)

track_white_elephant_B2 = Track.create!(
  title: "White Elephant",
  position: "B2",
  duration: "4:04",
  release: white_elephant
)

track_born_in_the_usa_A1 = Track.create!(
  title: "Born In The U.S.A.",
  position: "A1",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_A2 = Track.create!(
  title: "Cover Me",
  position: "A2",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_A3 = Track.create!(
  title: "Darlington County",
  position: "A3",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_A4 = Track.create!(
  title: "Working On The Highway",
  position: "A4",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_A5 = Track.create!(
  title: "Downbound Train",
  position: "A5",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_A6 = Track.create!(
  title: "I'm On Fire",
  position: "A6",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_B1 = Track.create!(
  title: "No Surrender",
  position: "B1",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_B2 = Track.create!(
  title: "Bobby Jean",
  position: "B2",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_B3 = Track.create!(
  title: "I'm Goin' Down",
  position: "B3",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_B4 = Track.create!(
  title: "Glory Days",
  position: "B4",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_B5 = Track.create!(
  title: "Dancing In The Dark",
  position: "B5",
  duration: "",
  release: born_in_the_usa
)

track_born_in_the_usa_B6 = Track.create!(
  title: "My Hometown",
  position: "B6",
  duration: "",
  release: born_in_the_usa
)

track_tallulah_A1 = Track.create!(
  title: "Youth",
  position: "A1",
  duration: "3:20",
  release: tallulah
)

track_tallulah_A2 = Track.create!(
  title: "Blue Sky Blue",
  position: "A2",
  duration: "3:50",
  release: tallulah
)

track_tallulah_A3 = Track.create!(
  title: "Daily Habit",
  position: "A3",
  duration: "3:46",
  release: tallulah
)

track_tallulah_A4 = Track.create!(
  title: "Fear Of Flying",
  position: "A4",
  duration: "3:56",
  release: tallulah
)

track_tallulah_A5 = Track.create!(
  title: "Rodeo",
  position: "A5",
  duration: "3:34",
  release: tallulah
)

track_tallulah_A6 = Track.create!(
  title: "Tallulah",
  position: "A6",
  duration: "3:53",
  release: tallulah
)

track_tallulah_B1 = Track.create!(
  title: "Shapes And Sounds",
  position: "B1",
  duration: "4:16",
  release: tallulah
)

track_tallulah_B2 = Track.create!(
  title: "Guillotine",
  position: "B2",
  duration: "3:43",
  release: tallulah
)

track_tallulah_B3 = Track.create!(
  title: "Kyoto",
  position: "B3",
  duration: "4:31",
  release: tallulah
)

track_tallulah_B4 = Track.create!(
  title: "Kite",
  position: "B4",
  duration: "3:27",
  release: tallulah
)

track_tallulah_B5 = Track.create!(
  title: "Windmill",
  position: "B5",
  duration: "4:09",
  release: tallulah
)

track_tallulah_B6 = Track.create!(
  title: "Lonely Hollow Days",
  position: "B6",
  duration: "3:33",
  release: tallulah
)

track_the_great_herald_of_misery_A1 = Track.create!(
  title: "Now",
  position: "A1",
  duration: "",
  release: the_great_herald_of_misery
)

track_the_great_herald_of_misery_A2 = Track.create!(
  title: "Watch Me Break The Neck Of The Hypocrites",
  position: "A2",
  duration: "",
  release: the_great_herald_of_misery
)

track_the_great_herald_of_misery_A3 = Track.create!(
  title: "Spill Torrents Of Carcass On The Ground And Piss On Them",
  position: "A3",
  duration: "",
  release: the_great_herald_of_misery
)

track_the_great_herald_of_misery_A4 = Track.create!(
  title: "Till The Seventh Snake Eat Their Empty Shell",
  position: "A4",
  duration: "",
  release: the_great_herald_of_misery
)

track_the_great_herald_of_misery_A5 = Track.create!(
  title: "I'm A Symmetric Mass Of Hate",
  position: "A5",
  duration: "",
  release: the_great_herald_of_misery
)

track_the_great_herald_of_misery_B1 = Track.create!(
  title: "Trapped In A Gravitational Abyss",
  position: "B1",
  duration: "",
  release: the_great_herald_of_misery
)

track_the_great_herald_of_misery_B2 = Track.create!(
  title: "I'm The Great Herald Of Misery",
  position: "B2",
  duration: "",
  release: the_great_herald_of_misery
)

track_hots_space_A1 = Track.create!(
  title: "Staying Power",
  position: "A1",
  duration: "",
  release: hots_space
)

track_hots_space_A2 = Track.create!(
  title: "Dancer",
  position: "A2",
  duration: "",
  release: hots_space
)

track_hots_space_A3 = Track.create!(
  title: "Back Chat",
  position: "A3",
  duration: "",
  release: hots_space
)

track_hots_space_A4 = Track.create!(
  title: "Body Language",
  position: "A4",
  duration: "",
  release: hots_space
)

track_hots_space_A5 = Track.create!(
  title: "Action This Day",
  position: "A5",
  duration: "",
  release: hots_space
)

track_hots_space_B1 = Track.create!(
  title: "Put Out The Fire",
  position: "B1",
  duration: "",
  release: hots_space
)

track_hots_space_B2 = Track.create!(
  title: "Life Is Real (Song For Lennon)",
  position: "B2",
  duration: "",
  release: hots_space
)

track_hots_space_B3 = Track.create!(
  title: "Calling All Girls",
  position: "B3",
  duration: "",
  release: hots_space
)

track_hots_space_B4 = Track.create!(
  title: "Las Palabras De Amor (The Words Of Love)",
  position: "B4",
  duration: "",
  release: hots_space
)

track_hots_space_B5 = Track.create!(
  title: "Cool Cat",
  position: "B5",
  duration: "",
  release: hots_space
)

track_hots_space_B6 = Track.create!(
  title: "David Bowie Under Pressure",
  position: "B6",
  duration: "",
  release: hots_space
)

track_silver_bullet_A1 = Track.create!(
  title: "Warrior",
  position: "A1",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_A2 = Track.create!(
  title: "Rebel Heart",
  position: "A2",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_A3 = Track.create!(
  title: "Gamblers, Players, Thieves And Whores",
  position: "A3",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_A4 = Track.create!(
  title: "Good Lovin'",
  position: "A4",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_A5 = Track.create!(
  title: "Did I",
  position: "A5",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_B1 = Track.create!(
  title: "Let My Love",
  position: "B2",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_B2 = Track.create!(
  title: "You're Gonna Love Me",
  position: "B2",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_B3 = Track.create!(
  title: "How Low",
  position: "B3",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_B4 = Track.create!(
  title: "Silver Bullet",
  position: "B4",
  duration: "",
  release: silver_bullet
)

track_silver_bullet_B5 = Track.create!(
  title: "Crazy Over Love",
  position: "B5",
  duration: "",
  release: silver_bullet
)

track_the_reverb_conspiracy_volume_six_A1 = Track.create!(
  title: "Julia Robert - Mud Girl",
  position: "A1",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_A2 = Track.create!(
  title: "ice Biscuit - Out Of Sight",
  position: "A2",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_A3 = Track.create!(
  title: "Frankie And The Witch - Fingers I Am Underneath You",
  position: "A3",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_B1 = Track.create!(
  title: "Medicine Boy - Water Girl",
  position: "B1",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_B2 = Track.create!(
  title: "FireFriend - Surface To Air",
  position: "B2",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_B3 = Track.create!(
  title: "Nest Egg - DMTIV",
  position: "B3",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_B4 = Track.create!(
  title: "Steeple  - Remove Ferris Noir",
  position: "B4",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_C1 = Track.create!(
  title: "Float - Watch",
  position: "C1",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_C2 = Track.create!(
  title: "Crimen - Flahzz",
  position: "C2",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_C3 = Track.create!(
  title: "Japanese Television - Tick Tock",
  position: "C3",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_C4 = Track.create!(
  title: "Selbram - This City Tou Know",
  position: "C4",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_C5 = Track.create!(
  title: "Super Paradise",
  position: "C5",
  duration: "6:30",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_D1 = Track.create!(
  title: "Verstärker - Mit Glück",
  position: "D1",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)

track_the_reverb_conspiracy_volume_six_D2 = Track.create!(
  title: "Psychic Lemon - Interstellar Fuzz Star",
  position: "D2",
  duration: "",
  release: the_reverb_conspiracy_volume_six
)



track_the_dark_side_of_the_moon_A1 = Track.create!(
  title: "Speak To Me",
  position: "A1",
  duration: "1:30",
  release: the_dark_side_of_the_moon
)

track_the_dark_side_of_the_moon_A2 = Track.create!(
  title: "Breathe",
  position: "A2",
  duration: "2:43",
  release: the_dark_side_of_the_moon
)

track_the_dark_side_of_the_moon_A3 = Track.create!(
  title: "On The Run",
  position: "A3",
  duration: "3:30",
  release: the_dark_side_of_the_moon
)

track_the_dark_side_of_the_moon_A4 = Track.create!(
  title: "Time",
  position: "A4",
  duration: "6:53",
  release: the_dark_side_of_the_moon
)
track_the_dark_side_of_the_moon_A5 = Track.create!(
  title: "The Great Gig In The Sky",
  position: "A5",
  duration: "4:15",
  release: the_dark_side_of_the_moon
)

track_the_dark_side_of_the_moon_B1 = Track.create!(
  title: "Money",
  position: "track_silver_bullet_B1",
  duration: "6:30",
  release: the_dark_side_of_the_moon
)

track_the_dark_side_of_the_moon_B2 = Track.create!(
  title: "Us And Them",
  position: "B2",
  duration: "7:34",
  release: the_dark_side_of_the_moon
)

track_the_dark_side_of_the_moon_B3 = Track.create!(
  title: "Any Colour You Like",
  position: "B3",
  duration: "3:24",
  release: the_dark_side_of_the_moon
)

track_the_dark_side_of_the_moon_B4 = Track.create!(
  title: "Brain Damage",
  position: "B4",
  duration: "3:50",
  release: the_dark_side_of_the_moon
)

track_the_dark_side_of_the_moon_B5 = Track.create!(
  title: "Eclipse",
  position: "B5",
  duration: "1:45",
  release: the_dark_side_of_the_moon
)

track_rage_against_the_machine_A1 = Track.create!(
  title: "Bombtrack",
  position: "A1",
  duration: "4:04",
  release: rage_against_the_machine
)

track_rage_against_the_machine_A2 = Track.create!(
  title: "Killing In The Name",
  position: "A2",
  duration: "5:13",
  release: rage_against_the_machine
)

track_rage_against_the_machine_A3 = Track.create!(
  title: "Take The Power Back",
  position: "A3",
  duration: "5:35",
  release: rage_against_the_machine
)

track_rage_against_the_machine_A4 = Track.create!(
  title: "Settle For Nothing",
  position: "A4",
  duration: "4:47",
  release: rage_against_the_machine
)

track_rage_against_the_machine_A5 = Track.create!(
  title: "Bullet In The Head ",
  position: "A5",
  duration: "4:46",
  release: rage_against_the_machine
)

track_rage_against_the_machine_B1 = Track.create!(
  title: "Know Your Enemy",
  position: "B1",
  duration: "4:54",
  release: rage_against_the_machine
)

track_rage_against_the_machine_B2 = Track.create!(
  title: "Wake Up",
  position: "B2",
  duration: "6:04",
  release: rage_against_the_machine
)

track_rage_against_the_machine_B3 = Track.create!(
  title: "Fistful Of Steel",
  position: "B3",
  duration: "5:30",
  release: rage_against_the_machine
)

track_rage_against_the_machine_B4 = Track.create!(
  title: "Township Rebellion",
  position: "B4",
  duration: "5:24",
  release: rage_against_the_machine
)

track_rage_against_the_machine_B5 = Track.create!(
  title: "Freedom",
  position: "B5",
  duration: "6:06",
  release: rage_against_the_machine
)

puts "Create preferences..."

preferences_steven = Preference.create!(
  genre: rock,
  user: steven
)

puts "Create records..."

the_dark_side_of_the_moon_steven = Record.create!(
  release: the_dark_side_of_the_moon,
  user: steven,
  condition: "Near mint",
  swappable: true,
  out: false
)

nevermind_steven = Record.create!(
  release: nevermind,
  user: steven,
  condition: "Very good plus",
  swappable: true,
  out: false
)

nevermind_steven = Record.create!(
  release: nevermind,
  user: steven,
  condition: "Very good plus",
  swappable: true,
  out: false
)

loaded_steven = Record.create!(
  release: loaded,
  user: steven,
  condition: "Mint",
  swappable: false,
  out: false
)

hots_space_steven = Record.create!(
  release: loaded,
  user: steven,
  condition: "Very good",
  swappable: true,
  out: false
)

hot_rats_steven = Record.create!(
  release: hot_rats,
  user: steven,
  condition: "Very good plus",
  swappable: false,
  out: false
)

in_rainbows_steven = Record.create!(
  release: hot_rats,
  user: steven,
  condition: "Mint",
  swappable: false,
  out: false
)

rage_against_the_machine_yanis = Record.create!(
  release: rage_against_the_machine,
  user: yanis,
  condition: "Very good plus",
  swappable: true,
  out: false
)

born_in_the_usa_volodia = Record.create!(
  release: born_in_the_usa,
  user: volodia,
  condition: "Mint",
  swappable: true,
  out: false
)

homesick_amelie = Record.create!(
  release: homesick,
  user: amelie,
  condition: "Near Mint",
  swappable: true,
  out: false
)

puts "Create deals..."

deal_steven_yanis = Deal.create!(
  requester_record: the_dark_side_of_the_moon_steven,
  receiver_record: rage_against_the_machine_yanis,
  status: 'pending'
)

deal_volodia_steven = Deal.create!(
  requester_record: born_in_the_usa_volodia,
  receiver_record: nevermind_steven,
  status: 'pending'
)

deal_steven_amelie = Deal.create!(
  requester_record: hots_space_steven,
  receiver_record: homesick_amelie,
  status: 'pending'
)

puts "Finished!"
