require "faker" 

50.times do 
    #faker doesn't have Faker::Show.title
    title = Faker::Movie.unique.title 
    Show.create(name:title) 
end

50.times do 
    name = Faker::Name.unique.name 
    email = Faker::Internet.email
    password = Faker::Config.random.seed
    User.create(username:name, email:email, password_digest:password)
end

50.times do 
    content = Faker::Company.bs
    rating = rand(1..5)
    show = rand(1..50)
    user = rand(1..50)
    Review.create(content:content, rating:rating, show_id:show, user_id:user)
end