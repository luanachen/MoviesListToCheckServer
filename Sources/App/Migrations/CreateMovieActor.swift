//
//  File.swift
//  
//
//  Created by Luana Chen Chih Jun on 08/09/20.
//

import FluentPostgresDriver

struct CreateMovieActor: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(MovieActor.schema)
        .id()
        .field("movie_id", .uuid, .required, .references(Movie.schema, .id))
        .field("actor_id", .uuid, .required, .references(Actor.schema, .id))
        .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(MovieActor.schema)
        .delete()
    }
}
