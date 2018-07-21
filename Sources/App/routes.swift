import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        return "Hello, world!"
    }
    
    router.get("movies") { req -> Future<[Movie]> in
        return Movie.query(on: req).all()
    }
    
    router.get("movies", Movie.parameter) { req -> Future<Movie> in
        return try req.parameters.next(Movie.self)
    }
    
    router.post(Movie.self, at: "movies") { req, movie -> Future<HTTPResponseStatus> in
        return movie.save(on: req).transform(to: .created)
    }
    
    router.delete("movies", Movie.parameter) { req -> Future<HTTPResponseStatus> in
        return try req.parameters.next(Movie.self).delete(on: req).transform(to: .noContent)
    }
}
