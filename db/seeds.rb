# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

COLORS = [
  'black',
  'silver',
  'blue',
  'red',
  'orange',
  'gold',
  'white'
]

def sample_color
  COLORS.sample
end

20.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    shv_number: rand(23_456..87_563),
    radio: ['true', 'false'].sample
  )
end

20.times do |i|
  Glider.create(
    glider_type: Faker::Creature::Animal.name.capitalize,
    size: %w[XS S M L].sample,
    manufacturer: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
    serial_number: rand(108_000..668_990),
    year_manufactured: rand(1998..2020),
    student_id: i + 1,
    color_background: sample_color,
    color_arc: sample_color,
    color_oval: sample_color
  )
end

3.times do
  Glider.create(
    glider_type: Faker::Creature::Animal.name.capitalize,
    size: %w[XS S M L].sample,
    manufacturer: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
    serial_number: rand(108_000..668_990),
    year_manufactured: rand(1998..2020),
    color_background: sample_color,
    color_arc: sample_color,
    color_oval: sample_color
  )
end

18.times do
  Day.create(
    date: Faker::Date.between(from: '2019-01-01', to: '2020-12-31'),
    instructor: %w[Markus Ales Hana].sample,
    assistant: %w[Delf Salome Bayram].sample,
    takeoff: Faker::Mountain.name
  )
end

48.times do
  Attendance.create(
    day_id: rand(1..Day.count),
    student_id: rand(1..Student.count),
    glider_id: rand(1..Glider.count)
  )
end
