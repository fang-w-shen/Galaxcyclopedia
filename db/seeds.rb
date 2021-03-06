
num = 0
User.create!(name:  "Fang",
 email: "funkapunkafide@gmail.com",
 password:              "fang123",
 password_confirmation: "fang123",
 admin:     true,
 activated: true,
 activated_at: Time.zone.now,
 api_key:"#{num=num+1}")

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "fang123"
  User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now,
    api_key:"#{num=num+1}")
end

users = User.order(:created_at).take(6)
content = "galaxy"
users[0].posts.create!(content: content, picture:File.open(File.join(Rails.root, "background.png")))
users[1].posts.create!(content: content, picture:File.open(File.join(Rails.root, "background.png")))
users[2].posts.create!(content: content, picture:File.open(File.join(Rails.root, "background.png")))
users[3].posts.create!(content: content, picture:File.open(File.join(Rails.root, "background.png")))
users[4].posts.create!(content: content, picture:File.open(File.join(Rails.root, "background.png")))
users[5].posts.create!(content: content, picture:File.open(File.join(Rails.root, "background.png")))


# Following relationships
users = User.all
user  = users.first
following = users[1..5]
followers = users[1..5]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

planets = {
  "Mercury": {
    "distance_from_sun": " 46,001,200 / 69,816,900 km",
    "mass": "3.3011×10²³ kg",
    "average_temperature": "440 K",
    "volume": "6.083×10¹⁰ km³",
    "diameter": "4879 km",
    "orbital_period":"88 days",
    "moons": 0,
    "length_of_day":"4222.6 hours",
    "gravity":"3.7 m/s²",
    "major_gases":"Oxygen, Sodium, Hydrogen, Helium"
  },
  "Venus": {
    "distance_from_sun": "107,477,000 / 108,939,000 km",
    "mass": "4.8675×10²⁴ kg",
    "average_temperature": "737 K",
    "volume": "9.2843×10¹¹ km³",
    "diameter": "12,104 km",
    "orbital_period":"224.7 days",
    "moons": 0,
    "length_of_day":"2802 hours",
    "gravity":"8.9 m/s²",
    "major_gases":"Carbon Dioxide, Nitrogen"
  },
  "Earth": {
    "distance_from_sun": "147,095,000 / 152,100,000 km",
    "mass": "5.97237×10²⁴ kg",
    "average_temperature": "288 K",
    "volume": "1.08321×10¹² km³",
    "diameter": "12,756 km",
    "orbital_period":"365.2 days",
    "moons": 1,
    "length_of_day":"24 hours",
    "gravity":"9.8 m/s²",
    "major_gases":"Nitrogen, Oxygen, Argon"
  },
  "Mars": {
    "distance_from_sun": "206,669,000 / 249,209,300 km",
    "mass": "6.4171×10²³ kg",
    "average_temperature": "208 K",
    "volume": "1.6318×10¹¹ km³",
    "diameter": "6792 km",
    "orbital_period":"687 days",
    "moons": 2,
    "length_of_day":"24.7 hours",
    "gravity":"3.7 m/s²",
    "major_gases":"Carbon Dioxide, Nitrogen, Argon"
  },
  "Jupiter": {
    "distance_from_sun": "740,573,600 / 816,520,800 km",
    "mass": "1.8986×10²⁷ kg",
    "average_temperature": "163 K",
    "volume": "1.43128×10¹⁵ km³",
    "diameter": "142,984 km",
    "orbital_period":"4331 days",
    "moons": 67,
    "length_of_day":"9.9 hours",
    "gravity":"23.1 m/s²",
    "major_gases":"Hydrogen, Helium"
  },
  "Saturn": {
    "distance_from_sun": "1,353,572,956 / 1,513,325,783 km",
    "mass": "5.6846×10²⁶ kg",
    "average_temperature": "133 K",
    "volume": "8.2713×10¹⁴ km³",
    "diameter": "120,536 km",
    "orbital_period":"10,747 days",
    "moons": 62,
    "length_of_day":"10.7 hours",
    "gravity":"9.0 m/s²",
    "major_gases":"Hydrogen, Helium"
  },
  "Uranus": {
    "distance_from_sun": "2,748,938,461 / 3,004,419,704 km",
    "mass": "8.68×10²⁵ kg",
    "average_temperature": "78 K",
    "volume": "6.833×10¹³ km³",
    "diameter": "51,118 km",
    "orbital_period":"30,589 days",
    "moons": 27,
    "length_of_day":"17.2 hours",
    "gravity":"8.7 m/s²",
    "major_gases":"Methane, Hydrogen, Helium"
  },
  "Neptune": {
    "distance_from_sun": "4,452,940,833 / 4,553,946,490 km",
    "mass": "1.0243×10²⁶ kg",
    "average_temperature": "73 K",
    "volume": "6.254×10¹³ km³",
    "diameter": "49,528 km",
    "orbital_period":"59,800 days",
    "moons": 14,
    "length_of_day":"16.1 hours",
    "gravity":"11.0 m/s²",
    "major_gases":"Methane, Hydrogen, Helium"
  }
}
planets.each do |planet|
  p planet
@planet = Planet.new(
name: planet[0],
distance_from_sun: planet[1][:distance_from_sun],
mass: planet[1][:mass],
average_temperature: planet[1][:average_temperature],
volume:planet[1][:volume],
diameter:planet[1][:diameter],
orbital_period:planet[1][:orbital_period],
moons:planet[1][:moons],
length_of_day:planet[1][:length_of_day],
gravity:planet[1][:gravity],
major_gases:planet[1][:major_gases],




  )
@planet.save
end