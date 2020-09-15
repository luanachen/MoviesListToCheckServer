import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) throws {
    
    if let urlString = Environment.get("DATABASE_URL"), let url = URL(string: urlString) {
        // Remote db
        try app.databases.use(.postgres(url: url), as: .psql)
    } else {
        // Local db
       app.databases.use(.postgres(
        hostname: "localhost",
        username: "fvd_ljun",
        password: "",
        database: "moviesdb"
        ), as: .psql)
    }
    
    app.migrations.add(CreateMovie())
    app.migrations.add(CreateReview())
    app.migrations.add(AddPosterColumnToMovies())
    
    try routes(app)
}
