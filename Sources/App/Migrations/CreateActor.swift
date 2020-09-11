//
//  File.swift
//  
//
//  Created by Luana Chen Chih Jun on 08/09/20.
//

import FluentPostgresDriver

struct CreateActor: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Actor.schema)
        .id()
        .field("name", .string)
        .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Actor.schema)
        .delete()
    }
}
