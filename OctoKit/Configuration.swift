import Foundation
import RequestKit
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public let githubBaseURL = "https://api.github.com"
public let githubWebURL = "https://github.com"

public let OctoKitErrorDomain = "com.nerdishbynature.octokit"

public struct TokenConfiguration: Configuration {
    public var apiEndpoint: String
    public var accessToken: String?
    public let errorDomain = OctoKitErrorDomain
    public private(set) var authorizationHeader: String? = "Basic"

    /// Custom `Accept` header for API previews.
    ///
    /// Used for preview support of new APIs, for instance Reaction API.
    /// see: https://developer.github.com/changes/2016-05-12-reactions-api-preview/
    private var previewCustomHeaders: [HTTPHeader]?

    public var customHeaders: [HTTPHeader]? {
        // More (non-preview) headers can be appended if needed in the future
        return previewCustomHeaders
    }

    public init(_ token: String? = nil, url: String = githubBaseURL, previewHeaders: [PreviewHeader] = []) {
        apiEndpoint = url
        accessToken = token?.data(using: .utf8)!.base64EncodedString()
        previewCustomHeaders = previewHeaders.map { $0.header }
    }

    public init(bearerToken: String, url: String = githubBaseURL, previewHeaders: [PreviewHeader] = []) {
        apiEndpoint = url
        authorizationHeader = "Bearer"
        accessToken = bearerToken
        previewCustomHeaders = previewHeaders.map { $0.header }
    }
}

public struct OAuthConfiguration: Configuration {
    public var apiEndpoint: String
    public var accessToken: String?
    public let token: String
    public let secret: String
    public let scopes: [String]
    public let webEndpoint: String
    public let errorDomain = OctoKitErrorDomain

    /// Custom `Accept` header for API previews.
    ///
    /// Used for preview support of new APIs, for instance Reaction API.
    /// see: https://developer.github.com/changes/2016-05-12-reactions-api-preview/
    private var previewCustomHeaders: [HTTPHeader]?
    private let session: RequestKitURLSession

    public var customHeaders: [HTTPHeader]? {
        // More (non-preview) headers can be appended if needed in the future
        return previewCustomHeaders
    }

    public init(_ url: String = githubBaseURL,
                webURL: String = githubWebURL,
                token: String,
                secret: String,
                scopes: [String],
                previewHeaders: [PreviewHeader] = [],
                session: RequestKitURLSession = URLSession.shared) {
        apiEndpoint = url
        webEndpoint = webURL
        self.token = token
        self.secret = secret
        self.scopes = scopes
        self.session = session
        previewCustomHeaders = previewHeaders.map { $0.header }
    }

    public func authenticate() -> URL? {
        return OAuthRouter.authorize(self).URLRequest?.url
    }

    public func authorize(code: String, completion: @escaping (_ config: TokenConfiguration) -> Void) {
        let request = OAuthRouter.accessToken(self, code).URLRequest
        if let request = request {
            let task = session.dataTask(with: request) { data, response, _ in
                if let response = response as? HTTPURLResponse {
                    if response.statusCode != 200 {
                        return
                    } else {
                        if let data = data, let string = String(data: data, encoding: .utf8) {
                            let accessToken = self.accessTokenFromResponse(string)
                            if let accessToken = accessToken {
                                let config = TokenConfiguration(accessToken, url: self.apiEndpoint)
                                completion(config)
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }

    #if compiler(>=5.5.2) && canImport(_Concurrency)
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func authorize(code: String) async throws -> TokenConfiguration? {
        let request = OAuthRouter.accessToken(self, code).URLRequest
        if let request = request {
            let (data, response) = try await session.data(for: request, delegate: nil)
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    return nil
                } else {
                    if let string = String(data: data, encoding: .utf8) {
                        let accessToken = accessTokenFromResponse(string)
                        if let accessToken = accessToken {
                            return TokenConfiguration(accessToken, url: apiEndpoint)
                        }
                    }
                }
            }
        }
        return nil
    }
    #endif

    public func handleOpenURL(url: URL, completion: @escaping (_ config: TokenConfiguration) -> Void) {
        if let code = url.URLParameters["code"] {
            authorize(code: code) { config in
                completion(config)
            }
        }
    }

    #if compiler(>=5.5.2) && canImport(_Concurrency)
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func handleOpenURL(url: URL) async throws -> TokenConfiguration? {
        if let code = url.URLParameters["code"] {
            return try await authorize(code: code)
        }
        return nil
    }
    #endif

    public func accessTokenFromResponse(_ response: String) -> String? {
        let accessTokenParam = response.components(separatedBy: "&").first
        if let accessTokenParam = accessTokenParam {
            return accessTokenParam.components(separatedBy: "=").last
        }
        return nil
    }
}

enum OAuthRouter: Router {
    case authorize(OAuthConfiguration)
    case accessToken(OAuthConfiguration, String)

    var configuration: Configuration {
        switch self {
        case let .authorize(config): return config
        case let .accessToken(config, _): return config
        }
    }

    var method: HTTPMethod {
        switch self {
        case .authorize:
            return .GET
        case .accessToken:
            return .POST
        }
    }

    var encoding: HTTPEncoding {
        switch self {
        case .authorize:
            return .url
        case .accessToken:
            return .form
        }
    }

    var path: String {
        switch self {
        case .authorize:
            return "login/oauth/authorize"
        case .accessToken:
            return "login/oauth/access_token"
        }
    }

    var params: [String: Any] {
        switch self {
        case let .authorize(config):
            let scope = (config.scopes as NSArray).componentsJoined(by: ",")
            return ["scope": scope, "client_id": config.token, "allow_signup": "false"]
        case let .accessToken(config, code):
            return ["client_id": config.token, "client_secret": config.secret, "code": code]
        }
    }

    #if canImport(FoundationNetworking)
    typealias FoundationURLRequestType = FoundationNetworking.URLRequest
    #else
    typealias FoundationURLRequestType = Foundation.URLRequest
    #endif

    var URLRequest: FoundationURLRequestType? {
        switch self {
        case let .authorize(config):
            let url = URL(string: path, relativeTo: URL(string: config.webEndpoint)!)
            let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
            return request(components!, parameters: params)
        case let .accessToken(config, _):
            let url = URL(string: path, relativeTo: URL(string: config.webEndpoint)!)
            let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
            return request(components!, parameters: params)
        }
    }
}
