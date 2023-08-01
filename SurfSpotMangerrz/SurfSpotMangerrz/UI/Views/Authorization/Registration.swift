//
//  Registration.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI

struct Registration: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        let valid = email.isValidEmail() && password.count >= 8 && username.count > 4
        let loading = authViewModel.createAccountLoading
        
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "person.crop.circle")
                    TextField("Username", text: $username)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .textContentType(.username)
                        .disabled(loading)
                }
                .modifier(Bordered())
                if !username.isEmpty && username.count <= 4 {
                    Text("Username must have >4 characters")
                        .font(.caption)
                }
                HStack {
                    Image(systemName: "envelope")
                    TextField("E-Mail", text: $email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .disabled(loading)
                }
                .modifier(Bordered())
                if !email.isEmpty && !email.isValidEmail() {
                    Text("E-Mail format invalid")
                        .font(.caption)
                }
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .disabled(loading)
                }
                .modifier(Bordered())
                if !password.isEmpty && password.count <= 7 {
                    Text("Password must have >8 characters")
                        .font(.caption)
                }
                Spacer()
                if authViewModel.createAccountFailed {
                    Text("Account could not be created. Please check if you already have an account.")
                        .foregroundColor(.red)
                }
                Button {
                    authViewModel.createAccount(email: email, password: password, username: username)
                } label: {
                    HStack {
                        if loading {
                            ProgressView()
                        }
                        Text("Create Account")
                    }
                }
                .disabled(!valid || loading)
            }
            .padding()
            .navigationTitle("Registration")
        }
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
            .environmentObject(AuthViewModel())
    }
}
