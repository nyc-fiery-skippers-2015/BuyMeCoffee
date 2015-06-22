require 'faker'


1.times do
 User.create(name: Faker::Name.first_name, about: Faker::Lorem.paragraph, email: Faker::Internet.email, password: Faker::Number.number(5), status: true, linkedin: "donovanholness")
end

