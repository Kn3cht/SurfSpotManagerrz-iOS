//
//  AppWrapper.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 01.08.23.
//

import SwiftUI

struct AppWrapper: View {
    var body: some View {
        TabView {
            SurfSpotList()
                .tabItem {
                    Label("Surf Spots", systemImage: "figure.surfing")
                }
        
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .navigationTitle("Profile")
        }
    }
}

struct AppWrapper_Previews: PreviewProvider {
    static var previews: some View {
        AppWrapper()
    }
}
