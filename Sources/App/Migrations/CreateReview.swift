//
//  File.swift
//  
//
//  Created by Luana Chen Chih Jun on 04/09/20.
//

import FluentPostgresDriver

struct CreateReview: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Review.schema)
        .id()
        .field("title", .string)
        .field("body", .string)
        .field("movie_id", .uuid, .references(Movie.schema, .id))
        .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Review.schema)
        .delete()
    }
}
