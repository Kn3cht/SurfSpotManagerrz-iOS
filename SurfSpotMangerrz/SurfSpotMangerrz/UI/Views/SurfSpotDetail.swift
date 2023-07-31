//
//  SurfSpotDetail.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI
import SurfSpotManagerrzApi
import MapKit


struct SurfSpotDetail: View {
    
    var surfSpot: SurfSpotFragment
    
    var annotations: [MapAnnotation] {
        let coordinates = surfSpot.coordinates
        return [MapAnnotation(name: surfSpot.name, coordinate: CLLocationCoordinate2D(latitude: coordinates.lat!, longitude: coordinates.lon!))]
    }
    
    @State private var region: MKCoordinateRegion
    
    init(surfSpot: SurfSpotFragment) {
        self.surfSpot = surfSpot
        let coordinates = surfSpot.coordinates
        self._region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinates.lat!, longitude: coordinates.lon!), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(surfSpot.description)
                Spacer()
            }
            Map(coordinateRegion: $region, annotationItems: annotations) {
                MapMarker(coordinate: $0.coordinate)
            }
            .frame(height: 300)
            Spacer()
        }
        .padding()
            .navigationTitle(surfSpot.name)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
            }
    }
    
    struct MapAnnotation: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
    }
}

struct SurfSpotDetail_Previews: PreviewProvider {
    
    private struct Container: View {
        
        @StateObject var surfSpotViewModel = SurfSpotViewModel()
        
        var body: some View {
            Group {
                if let surfSpot = surfSpotViewModel.surfSpots.first {
                    SurfSpotDetail(surfSpot: surfSpot)
                } else {
                    Text("No surf spots")
                }
            }
                .onAppear {
                    surfSpotViewModel.listSurfSpots()
                }
        }
    }
    
    static var previews: some View {
        Container()
    }
}
