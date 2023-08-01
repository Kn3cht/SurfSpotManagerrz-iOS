//
//  Constants.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import Foundation

struct Constants {
    
    struct Security {
        public static let tokenKeychainKey: String = "token"
    }
    
    struct Network {
        /// Vercel
        public static let gqlEndpoint: URL = URL(string: "https://surf-spot-managerrz.vercel.app/graphql")!
    }
}
