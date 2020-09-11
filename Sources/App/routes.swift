import Fluent
import Vapor

func routes(_ app: Application) throws {

    let moviesController = MoviesController()
    let reviewsController = ReviewController()
    
    // MOVIES //
    
    // /movies POST
    app.post("movies", use: moviesController.create)
    
    // movies GET
    app.get("movies", use: moviesController.all)
    
    // /movies/:movieId DELETE
    app.delete("movies", ":movieId", use: moviesController.delete)
    
    // REVIEWS //
    
    // /reviews POST
    app.post("reviews", use: reviewsController.create)
    
    // /movies/:movieId/reviews GET
    app.get("movies", ":movieId", "reviews", use: reviewsController.getByMovieId)
}
