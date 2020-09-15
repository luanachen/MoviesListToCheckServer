import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) throws {
   
    try app.databases.use(.postgres(url: Environment.databaseURL), as: .psql)

    app.migrations.add(CreateMovie())
    app.migrations.add(CreateReview())
    app.migrations.add(AddPosterColumnToMovies())

    try routes(app)
}
