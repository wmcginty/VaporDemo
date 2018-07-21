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
    
    router.post(Movie.self, at: "movies") { req, movie -> Future<HTTPResponseStatus> in
        return movie.save(on: req).transform(to: .created)
    }
}
