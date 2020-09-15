//
//  File.swift
//  
//
//  Created by Luana Chen Chih Jun on 15/09/20.
//

import Vapor

extension Environment {
    
    static var databaseURL: URL {
        guard let urlString = Environment.get("DATABASE_URL"), let url = URL(string: urlString) else {
            fatalError("DATABASE_URL not configured")
        }
        return url
    }
}
