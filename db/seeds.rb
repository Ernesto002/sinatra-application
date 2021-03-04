require "faker" 

100.times do 
    #faker doesn't have Faker::Show.title
    show_title = Faker::Movie.title
    shows = Show.new(
        name: show_title 
    )

    shows.save 
end