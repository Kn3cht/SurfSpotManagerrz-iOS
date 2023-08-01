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
            if surfspotViewModel.surfSpotsLoading {
                ProgressView()
            } else {
                List {
                    ForEach(filteredSurfSpots, id: \._id) { surfSpot in
                        NavigationLink(value: surfSpot) {
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
                .confirmationDialog("Are you sure?", isPresented: $isPresentingDeletionAlert) {
                    if let spotToBeDeleted = spotToBeDeleted {
                        Button("Delete \(spotToBeDeleted.name)?", role: .destructive) {
                            surfspotViewModel.deleteSurfSpot(_id: spotToBeDeleted._id)
                            self.spotToBeDeleted = nil
                        }
                    }
                }
                .navigationTitle("Surf Spots")
                .navigationDestination(for: SurfSpotFragment.self) { surfSpot in
                    SurfSpotDetail(surfSpot: surfSpot)
                        .environmentObject(surfspotViewModel)
                }
                
            }
        }
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
        .listStyle(.plain)
        .refreshable {
            surfspotViewModel.listSurfSpots()
        }
        .onAppear {
            surfspotViewModel.listSurfSpots()
        }
        .searchable(text: $query)
        .navigationTitle("Surf Spots")
    }

}

struct SurfSpotList_Previews: PreviewProvider {
    static var previews: some View {
        SurfSpotList()
    }
}
