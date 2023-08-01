//
//  SurfSpotPreview.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 01.08.23.
//

import SwiftUI
import SurfSpotManagerrzApi
import MapKit

struct SurfSpotPreview: View {
    
    @EnvironmentObject var surfSpotViewModel: SurfSpotViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var region: MKCoordinateRegion
    @State var showDescription: Bool = false
    @State private var rating: Int?
    @State private var isPresentingDeletionAlert: Bool = false
    
    var surfSpot: SurfSpotFragment
    var toggleEdit: () -> Void

    init(surfSpot: SurfSpotFragment, toggleEdit: @escaping () -> Void) {
        self.surfSpot = surfSpot
        self.toggleEdit = toggleEdit
        self._rating = State(initialValue: surfSpot.rating)
        let coordinates = surfSpot.location.coordinates
        self._region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinates.lat, longitude: coordinates.lon), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    var annotations: [MapAnnotation] {
        let location = surfSpot.location
        let coordinates = location.coordinates
        let name = location.name
        return [MapAnnotation(name: name, coordinate: CLLocationCoordinate2D(latitude: coordinates.lat, longitude: coordinates.lon))]
    }
    
    var body: some View {
        Form {
            Section(header: Text("Info")) {
                HStack {
                    Text(surfSpot.name)
                    Spacer()
                }
                LocationSummary(name: surfSpot.location.name, address: surfSpot.location.address)
            }
            Section(header: Text("Description")) {
                HStack {
                    Button {
                        showDescription.toggle()
                    } label: {
                        Text(surfSpot.description)
                            .lineLimit(3)
                    }
                    .buttonStyle(.plain)
                    .sheet(isPresented: $showDescription) {
                        NavigationView {
                            VStack {
                                Text(surfSpot.description)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                            }
                            .padding()
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button {
                                        showDescription = false
                                    } label: {
                                        Text("Done")
                                    }
                                }
                            }
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationTitle("Description")
                        }
                        .presentationDetents([.medium, .large])
                    }
                    Spacer()
                }
            }
            Section(header: Text("Map")) {
                Map(coordinateRegion: $region, annotationItems: annotations) {
                    MapMarker(coordinate: $0.coordinate)
                }
                .frame(height: 200)
                Button {
                    let url = URL(string: "maps://?saddr=&daddr=\(surfSpot.location.coordinates.lat),\(surfSpot.location.coordinates.lon)")
                    if UIApplication.shared.canOpenURL(url!) {
                          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                } label: {
                    Text("Open in Apple Maps")
                }
            }
            Section(header: Text("Rating")) {
                Rating(rating: $rating, editable: false)
            }
            Section {
                Button {
                    isPresentingDeletionAlert.toggle()
                } label: {
                    Text("Delete")
                }
                .tint(.red)
                .confirmationDialog("Are you sure?", isPresented: $isPresentingDeletionAlert) {
                    Button("Delete \(surfSpot.name)?", role: .destructive) {
                        surfSpotViewModel.deleteSurfSpot(_id: surfSpot._id) {
                            if $0 {
                                dismiss()
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(surfSpot.name)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                if surfSpotViewModel.surfSpotUpdateLoading {
                    ProgressView()
                } else {
                    Button {
                        toggleEdit()
                    } label: {
                        Text("Edit")
                    }
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

struct SurfSpotPreview_Previews: PreviewProvider {
    
    
    private struct Container: View {
        @StateObject var surfSpotViewModel = SurfSpotViewModel()

        var body: some View {
            Group {
                if let surfSpot = surfSpotViewModel.surfSpots.first {
                    
                    SurfSpotPreview(surfSpot: surfSpot) {
                        print("toggle edit")
                    }
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
