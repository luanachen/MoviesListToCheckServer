//
//  File.swift
//  
//
//  Created by Luana Chen Chih Jun on 09/09/20.
//

import Foundation
import Vapor

final class ReviewController {
    
    func create(_ req: Request) throws -> EventLoopFuture<Review> {
        let review = try req.content.decode(Review.self)
        return review.create(on: req.db).map { review }
    }
    
    func getByMovieId(_ req: Request) throws -> EventLoopFuture<[Review]> {
        guard let movieId = req.parameters.get("movieId", as: UUID.self) else {
            throw Abort(.notFound)
        }
        
        return Review.query(on: req.db).filter(\.$movie.$id, .equal, movieId)
            .with(\.$movie)
            .all()
    }
}
