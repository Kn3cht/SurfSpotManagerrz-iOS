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
    
    var filteredSurfSpots: [SurfSpotFragment] {
        if query.isEmpty {
            return surfspotViewModel.surfSpots
        }
        let queryLowerCased = query.lowercased()
        return surfspotViewModel.surfSpots.filter({ $0.name.lowercased().contains(queryLowerCased) || $0.description.lowercased().contains(queryLowerCased)})
    }
    
    var body: some View {
        Group {
            if surfspotViewModel.surfSpotsLoading {
                ProgressView()
            } else {
                List {
                    ForEach(filteredSurfSpots, id: \._id) { surfSpot in
                        NavigationLink {
                            SurfSpotDetail(surfSpot: surfSpot)
                        } label: {
                            VStack {
                                HStack {
                                    HighlightedText(surfSpot.name, query: query)
                                    Spacer()
                                }
                                HStack {
                                    HighlightedText(surfSpot.description, query: query)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                NavigationLink {
                    Text("TODO")
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
