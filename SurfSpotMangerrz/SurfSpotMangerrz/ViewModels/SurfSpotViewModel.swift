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
    @Published var surfSpotUpdateLoading: Bool = false
    
    
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
    
    func createOrUpdateSurfSpot(surfSpot: SurfSpotFragment) {
        surfSpotUpdateLoading = true
        Network.shared.apollo.perform(mutation: CreateOrUpdateSurfSpotMutation(surfSpot: .some(SurfSpotInput(
            _id: surfSpot._id != nil ? .some(surfSpot._id) : .none,
            name: surfSpot.name,
            description: surfSpot.description,
            coordinates: CoordinatesInput(lat: .some(surfSpot.coordinates.lat!), lon: .some(surfSpot.coordinates.lon!))))
        )) { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case.success(let gqlResult):
                if let errors = gqlResult.errors {
                    print(errors)
                } else if let surfSpotUpdate = gqlResult.data?.createOrUpdateSurfSpot?.fragments.surfSpotFragment {
                    if self.surfSpots.contains(surfSpotUpdate) {
                        self.surfSpots = self.surfSpots.map { $0._id != surfSpot._id ? $0 : surfSpot }
                    } else {
                        self.surfSpots.append(surfSpot)
                    }
                } else {
                    print("failure")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
