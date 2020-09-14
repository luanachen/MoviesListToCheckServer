//
//  File.swift
//  
//
//  Created by Luana Chen Chih Jun on 04/09/20.
//

import Fluent
import Vapor

final class Review: Model, Content {
    
    static let schema = "reviews"
    
    @ID(key: .id)
    var id: UUID? // PK
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "body")
    var body: String
    
    // belongs to - Review belongs to a movie
    @Parent(key: "movie_id") // FK
    var movie: Movie
    
    init() {}
    
    init(id: UUID? = nil, title: String, body: String, movieId: UUID) {
        self.id = id
        self.title = title
        self.body = body
        self.$movie.id = movieId
    }
}
