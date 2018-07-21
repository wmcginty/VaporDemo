import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        return "Hello, world!"
    }
    
    router.get("movies") { req -> [Movie] in
        return [Movie(title: "Infinity War", year: 2018),
                Movie(title: "The Incredibles 2", year: 2018)]
    }
}
