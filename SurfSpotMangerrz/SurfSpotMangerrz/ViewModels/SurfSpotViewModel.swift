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
    @Published var deleteSurfSpotLoading: Bool = false
    
    
    func listSurfSpots() {
        surfSpotsLoading = true
        Network.shared.apollo.fetch(query: ListSurfSpotsQuery(), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            
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
    
    func createOrUpdateSurfSpot(_id: String?, name: String, description: String, annotationItem: AnnotationItem, completion: @escaping (SurfSpotFragment?) -> Void) {
        surfSpotUpdateLoading = true
        
        
        let surfSpotInput = SurfSpotInput(
            _id: _id != nil ? .some(_id!) : .none,
            name: name,
            description: description,
            location: LocationInput(
                name: annotationItem.title,
                address: annotationItem.subtitle,
                coordinates: CoordinatesInput(
                    lat: annotationItem.latitude,
                    lon: annotationItem.longitude
                )
            )
        )
        
        Network.shared.apollo.perform(mutation: CreateOrUpdateSurfSpotMutation(surfSpot: .some(surfSpotInput)
        )) { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case.success(let gqlResult):
                if let errors = gqlResult.errors {
                    print(errors)
                    completion(nil)
                } else if let surfSpotUpdate = gqlResult.data?.createOrUpdateSurfSpot?.fragments.surfSpotFragment {
                    if self.surfSpots.contains(where: { $0._id == surfSpotUpdate._id}) {
                        self.surfSpots = self.surfSpots.map { $0._id != surfSpotUpdate._id ? $0 : surfSpotUpdate }
                    } else {
                        self.surfSpots.append(surfSpotUpdate)
                    }
                    completion(surfSpotUpdate)
                } else {
                    print("failure")
                    completion(nil)
                }
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
    func deleteSurfSpot(_id: String) {
        deleteSurfSpotLoading = true
        Network.shared.apollo.perform(mutation: DeleteSurfSpotMutation(_id: _id)) { [weak self] result in
            guard let self = self else { return }
            self.deleteSurfSpotLoading = true

            switch result {
            case.success(let gqlResult):
                if let errors = gqlResult.errors {
                    print(errors)
                } else if let deletedSurfSpotId = gqlResult.data?.deleteSurfSpot {
                    self.surfSpots = self.surfSpots.filter { $0._id != deletedSurfSpotId }
                } else {
                    print("failure")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
