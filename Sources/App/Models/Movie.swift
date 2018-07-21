//
//  Movie.swift
//  App
//
//  Created by William McGinty on 7/20/18.
//

import Foundation
import Vapor
import FluentSQLite

struct Movie: Content {
    let title: String
    let year: Int
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}
