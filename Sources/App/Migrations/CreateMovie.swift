import FluentPostgresDriver

struct CreateMovie: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Movie.schema) //table name
        .id()
        .field("title", .string) //colum name
        .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Movie.schema)
        .delete()
    }
}
