//
//  MovieRouteController.swift
//  App
//
//  Created by William McGinty on 9/5/18.
//

import Vapor

struct MovieRouteCollection: RouteCollection {
    
    func boot(router: Router) throws {
        router.get("movies", use: getAllMoviesHandler)
        router.get("movies", Movie.parameter, use: getMovieHandler)
        router.post(Movie.self, at: "movies", use: postMovieHandler)
        router.delete("movies", Movie.parameter, use: deleteMovieHandler)
    }
}

// MARK: Helper
private extension MovieRouteCollection {
    
    func getAllMoviesHandler(request: Request) -> Future<[Movie]> {
        return Movie.query(on: request).all()
    }

    func getMovieHandler(request: Request) throws -> Future<Movie> {
        return try request.parameters.next(Movie.self)
    }

    func postMovieHandler(request: Request, movie: Movie) -> Future<HTTPResponseStatus> {
        return movie.save(on: request).transform(to: .created)
    }

    func deleteMovieHandler(request: Request) throws -> Future<HTTPResponseStatus> {
        return try request.parameters.next(Movie.self).delete(on: request).transform(to: .noContent)
    }
}
