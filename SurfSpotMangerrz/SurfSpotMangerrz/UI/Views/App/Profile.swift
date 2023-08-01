//
//  Profile.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 01.08.23.
//

import SwiftUI

struct Profile: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var deleteAccountAlertVisible: Bool = false
    
    var body: some View {
        NavigationStack {
            switch authViewModel.authState {
            case .authorized(let currentUser):
                Form {
                    Section {
                        HStack {
                            Text("Username")
                            Spacer()
                            Text(currentUser.username)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("E-Mail")
                            Spacer()
                            Text(currentUser.email)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Section {
                        Button("Log out") {
                            authViewModel.logout()
                        }
                    }
                    Section {
                        Button("Delete account") {
                            deleteAccountAlertVisible.toggle()
                        }
                        .tint(.red)
                        .confirmationDialog("Are you sure? This action will delete your account and all related resources.", isPresented: $deleteAccountAlertVisible) {
                            Button("Delete account permanently", role: .destructive) {
                                authViewModel.deleteAccount()
                            }
                        }
                    }
                }
                .navigationTitle("Profile")

            case .unauthorized:
                Text("Unauthorized")
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
            .environmentObject(AuthViewModel())
    }
}
