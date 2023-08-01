//
//  SurfSpotDetail.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 01.08.23.
//
import SwiftUI
import SurfSpotManagerrzApi
import MapKit


struct SurfSpotDetail: View {
    
    @State var editMode: Bool
    
    @State var surfSpot: SurfSpotFragment?
    
    init(surfSpot: SurfSpotFragment?, editMode: Bool = false) {
        self.surfSpot = surfSpot
        self._editMode = State(initialValue: editMode)
    }
    
    var body: some View {
        Group {
            if !editMode {
                if let surfSpot = surfSpot {
                    SurfSpotPreview(surfSpot: surfSpot) {
                        editMode.toggle()
                    }
                } else {
                    Text("Surfspot not present")
                }
            } else if let surfSpot = surfSpot {
                let location = surfSpot.location
                let coordinates = location.coordinates
                SurfSpotEdit( _id: surfSpot._id, name: surfSpot.name, description: surfSpot.description, selectedAddressAnnotation: AnnotationItem(
                    title: location.name,
                    subtitle: location.address,
                    latitude: coordinates.lat,
                    longitude: coordinates.lon
                ), rating: surfSpot.rating) { surfSpot in
                    self.surfSpot = surfSpot
                    editMode.toggle()
                }
            } else {
                SurfSpotEdit() { surfSpot in
                    self.surfSpot = surfSpot
                    editMode.toggle()
                }
            }
        }
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
            .environmentObject(surfSpotViewModel)
            .onAppear {
                surfSpotViewModel.listSurfSpots()
            }
        }
    }
    
    static var previews: some View {
        Container()
    }
}
