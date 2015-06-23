require 'faker'

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: "123" , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.7484" , longitude: "-73.9857" , image_url: "https://avatars3.githubusercontent.com/u/6180588?v=3&s=460" )

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: "123" , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.7506", longitude: "-73.9939" , image_url: "https://avatars2.githubusercontent.com/u/50019?v=3&s=460" )

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: "123" , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.7147" , longitude: "-73.9972", image_url: "https://avatars2.githubusercontent.com/u/191587?v=3&s=460")

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: "123" , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.7275" , longitude: "-73.9858", image_url: "https://avatars0.githubusercontent.com/u/4605783?v=3&s=460" )

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: "123" , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.7231", longitude: "-74.0008" , image_url: "https://avatars1.githubusercontent.com/u/1873205?v=3&s=460")

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: "123" , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.0131," , longitude: "-74.0100", image_url: "https://avatars1.githubusercontent.com/u/1297679?v=3&s=460")

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: '123' , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.5676" , longitude: "-74.0078", image_url:"https://avatars3.githubusercontent.com/u/9508782?v=3&s=460")

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: "123" , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.7586" , longitude: "-73.9792" , image_url: "https://avatars3.githubusercontent.com/u/10653751?v=3&s=460")

User.create(name:Faker::Name.first_name , about: Faker::Lorem.paragraph , status: true, password: "123" , email: Faker::Internet.email  , linkedin: "donovanholness" , latitude: "40.0000" , longitude: "-74.008" , image_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAALkAAAAJGRmY2ViMDgxLWFjZDEtNDg4NS05YzA0LWVmOTcxZGNjNzUxYw.jpg" )


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

