//
//  Movie.swift
//  App
//
//  Created by William McGinty on 7/20/18.
//

import Foundation
import Vapor
import FluentSQLite

struct Movie {
    var id: UUID?
    
    let title: String
    let year: Int
    
    init(id: UUID? = nil, title: String, year: Int) {
        self.id = id
        self.title = title
        self.year = year
    }
}

extension Movie: Content { }
extension Movie: SQLiteUUIDModel { }
extension Movie: Migration { }
extension Movie: Parameter { }
