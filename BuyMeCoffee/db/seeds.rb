require 'faker'


20.times do
 User.create(name: Faker::Name.first_name, about: Faker::Lorem.paragraph, email: Faker::Internet.email, password: Faker::Number.number(5), status: true, linkedin: "donovanholness")
end

Category.create(topic:"Hospitality and Travel")
Category.create(topic:"Science and Pharmaceutical Research")
Category.create(topic:"Health and Medical")
Category.create(topic:"Retail")
Category.create(topic:"Arts, Media and Publishing")
Category.create(topic:"Legal")
Category.create(topic:"Automotive")
Category.create(topic:"Software Engineeing")
Category.create(topic:"Marketing")
Category.create(topic:"IT")
