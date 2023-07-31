//
//  AuthorizationInterceptor.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import Foundation
import Apollo
import ApolloAPI
import KeychainSwift

class AuthorizationInterceptor: ApolloInterceptor {
    
    var id: String = "Authorization Interceptor"
    
    static let tokenKeychainKey = "token"
    
    func interceptAsync<Operation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
        let keychain = KeychainSwift()
        if let token = keychain.get(AuthorizationInterceptor.tokenKeychainKey) {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
        }
                
        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
