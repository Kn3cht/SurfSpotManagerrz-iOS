//
//  SurfSpotList.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI
import SurfSpotManagerrzApi

struct SurfSpotList: View {
    
    @StateObject var surfspotViewModel = SurfSpotViewModel()
    @State var query: String = ""
    @State var spotToBeDeleted: SurfSpotFragment? = nil
    @State private var isPresentingDeletionAlert: Bool = false

    
    var filteredSurfSpots: [SurfSpotFragment] {
        if query.isEmpty {
            return surfspotViewModel.surfSpots
        }
        let queryLowerCased = query.lowercased()
        return surfspotViewModel.surfSpots.filter({ $0.name.lowercased().contains(queryLowerCased) || $0.description.lowercased().contains(queryLowerCased)})
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if surfspotViewModel.surfSpotsLoading {
                    ProgressView()
                } else {
                    if surfspotViewModel.surfSpots.isEmpty {
                        Text("No surf spots yet")
                    } else {
                        
                            List {
                                ForEach(filteredSurfSpots, id: \._id) { surfSpot in
                                    NavigationLink(value: surfSpot) {
                                        HStack {
                                            VStack {
                                                HStack {
                                                    HighlightedText(surfSpot.name, query: query)
                                                    Spacer()
                                                }
                                                HStack {
                                                    HighlightedText(surfSpot.description, query: query)
                                                        .lineLimit(1)
                                                        .font(.caption)
                                                        .foregroundColor(.gray)
                                                    Spacer()
                                                }
                                            }
                                            if let rating = surfSpot.rating {
                                                HStack {
                                                    Text("\(rating)")
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.yellow)
                                                }
                                            }
                                        }
                                    }
                                    .swipeActions {
                                        Button {
                                            spotToBeDeleted = surfSpot
                                            isPresentingDeletionAlert = true
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                        .tint(.red)
                                        
                                    }
                                }
                            }
                            .listStyle(.insetGrouped)
                            .refreshable {
                                surfspotViewModel.listSurfSpots()
                            }
                            .searchable(text: $query)
                            .confirmationDialog("Are you sure?", isPresented: $isPresentingDeletionAlert) {
                                if let spotToBeDeleted = spotToBeDeleted {
                                    Button("Delete \(spotToBeDeleted.name)?", role: .destructive) {
                                        surfspotViewModel.deleteSurfSpot(_id: spotToBeDeleted._id) {
                                            if $0 {
                                                self.spotToBeDeleted = nil
                                            }
                                        }
                                    }
                                }
                            }
                            .navigationDestination(for: SurfSpotFragment.self) { surfSpot in
                                SurfSpotDetail(surfSpot: surfSpot)
                                    .environmentObject(surfspotViewModel)
                            }
                        
                    }
                }
            }
            .navigationTitle("Surf Spots")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        SurfSpotDetail(surfSpot: nil, editMode: true)
                            .environmentObject(surfspotViewModel)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .onAppear {
            surfspotViewModel.listSurfSpots()
        }
    }

}

struct SurfSpotList_Previews: PreviewProvider {
    static var previews: some View {
        SurfSpotList()
    }
}
