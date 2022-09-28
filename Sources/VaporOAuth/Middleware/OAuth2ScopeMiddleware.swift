import Vapor

public struct OAuth2ScopeMiddleware: AsyncMiddleware {
    let requiredScopes: [String]?

    public init(requiredScopes: [String]?) {
        self.requiredScopes = requiredScopes
    }

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
//        try await request.oauth.assertScopes(requiredScopes)

        return try await next.respond(to: request)
    }
}
