//
//  ContentView.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            if authViewModel.findCurrentUserLoading {
                ProgressView()
            } else {
                switch authViewModel.authState {
                case .authorized:
                    AppWrapper()
                case .unauthorized:
                    Authorization()
                }
            }
        }
        .onAppear {
            authViewModel.findCurrentUser()
        }
        .environmentObject(authViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
