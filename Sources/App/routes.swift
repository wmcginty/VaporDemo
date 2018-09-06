import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    let collections: [RouteCollection] = [MovieRouteCollection()]
    try collections.forEach { try $0.boot(router: router) }
}
