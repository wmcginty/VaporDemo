import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        return "Hello, world!"
    }
}
