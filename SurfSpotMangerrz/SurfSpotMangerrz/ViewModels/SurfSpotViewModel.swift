//
//  SurfSpotViewModel.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import Foundation
import SurfSpotManagerrzApi

class SurfSpotViewModel: ObservableObject {
    
    @Published var surfSpots: [SurfSpotFragment] = []
    @Published var surfSpotsLoading: Bool = false
    
    
    func listSurfSpots() {
        surfSpotsLoading = true
        Network.shared.apollo.fetch(query: ListSurfSpotsQuery()) { [weak self] result in
            
            guard let self = self else { return }
            
            self.surfSpotsLoading = false
            
            switch result {
            case.success(let gqlResult):
                if let errors = gqlResult.errors {
                    print(errors)
                } else if let surfSpots = gqlResult.data?.listSurfSpots {
                    self.surfSpots = surfSpots.compactMap { $0?.fragments.surfSpotFragment }
                } else {
                    print("failure")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
