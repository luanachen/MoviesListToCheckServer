import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) throws {
   
    app.databases.use(.postgres(
        hostname: "localhost",
        username: "luanachen",
        password: "",
        database: "movieListToCheck"
    ), as: .psql)

    app.migrations.add(CreateMovie())
    app.migrations.add(CreateReview())
    app.migrations.add(AddPosterColumnToMovies())

    try routes(app)
}
