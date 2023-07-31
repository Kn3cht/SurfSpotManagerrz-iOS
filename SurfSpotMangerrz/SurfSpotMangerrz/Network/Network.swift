//
//  ApolloClient.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import Foundation
import Apollo

class Network: ObservableObject {
    
    @Published var connectionStatus: BackendConnection = .notYetConnected
    
    static let shared = Network()

    
    private(set) lazy var apollo: ApolloClient = { [self] in
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
        let provider = NetworkInterceptorProvider(
            client: client,
            store: store)
        
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: Constants.Network.gqlEndpoint)

        return ApolloClient(networkTransport: transport, store: store)
    }()
}

enum BackendConnection {
    case notYetConnected
    case connected
    case disconnected
}

