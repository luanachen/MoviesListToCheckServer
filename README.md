# MoviesListToCheckServer
:book: A movie list server in Swift build with Vapor.


This API written in swift is currently deployed to Heroku postgres database, you can check how it looks like at https://movielisttocheck.herokuapp.com/movies

## Movies - Add a movie [/movies/]
 
[POST]

+ Request (application/json)

        {
            "title" : "Arrival"
        }

+ Response 200 (application/json)

        {
            "id": "DA69BF03-EF9F-46DA-8BE2-61F66DC59A7C",
            "title": "Arrival"
        }

## Reviews - Add a review [/reviews/]
 
[POST]

+ Request (application/json)

        {
            "title": "Best movie ever", 
            "body": "This movie is just so deep and memorable",
            "movie": {
            "id": "CB86B42F-8F0E-495E-87E7-1AE85BD5A315"
            }
        }

+ Response 200 (application/json)

        { 
        "movie": {
        "id": "CB86B42F-8F0E-495E-87E7-1AE85BD5A315"
        }, 
        "id": "BCB41C39-BE91-41B3-8A3F-E25565875448",
        "title": "Best movie ever",
        "body": "This movie is just so deep and memorable"
}

