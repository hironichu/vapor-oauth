import Vapor

public protocol TokenManager: Sendable {
    func generateAccessRefreshTokens(
        clientID: String,
        userID: String?,
        scopes: [String]?,
        accessTokenExpiryTime: Int
    ) async throws -> (AccessToken, RefreshToken)

    func generateAccessToken(
        clientID: String,
        userID: String?,
        scopes: [String]?,
        expiryTime: Int
    ) async throws -> AccessToken

    func getRefreshToken(_ refreshToken: String) async throws -> RefreshToken?
    func getAccessToken(_ accessToken: String) async throws -> AccessToken?
    func updateRefreshToken(_ refreshToken: RefreshToken, scopes: [String]) async throws
}
