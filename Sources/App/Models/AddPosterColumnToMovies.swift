//
//  File.swift
//  
//
//  Created by Luana Chen Chih Jun on 09/09/20.
//

import FluentPostgresDriver

struct AddPosterColumnToMovies: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Movie.schema)
        .field("poster", .string)
        .update()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Movie.schema)
        .deleteField("poster")
        .delete()
    }
}
