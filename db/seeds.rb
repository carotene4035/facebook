# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# userがまだ3人しか入っていないので、
# user_idは1~3のランダムな値を入れてやる
50.times do |n|
  user_id = Random.rand(1..3)
  title   = Faker::HarryPotter.quote
  content = Faker::Lorem.paragraph

  Topic.create!(
    user_id: user_id,
    title: title,
    content: content
  )
end
