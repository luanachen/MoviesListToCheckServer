import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) throws {
   
    app.databases.use(.postgres(
        hostname: "lallah.db.elephantsql.com",
        username: "xwlenakf",
        password: "xwdz-hXD9xrnyh4XrETAtbFAR5HJCptK",
        database: "xwlenakf"
    ), as: .psql)

    app.migrations.add(CreateMovie())
    app.migrations.add(CreateReview())
    app.migrations.add(AddPosterColumnToMovies())

    try routes(app)
}
