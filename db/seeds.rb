require "faker" 

100.times do 
    show_title = Faker::Movie.title
    shows = Show.new(
        name: show_title 
    )

    shows.save 
end