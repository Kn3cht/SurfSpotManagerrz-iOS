//
//  Login.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        let valid = !email.isEmpty && !password.isEmpty
        let loading = authViewModel.loginLoading
        
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "envelope")
                    TextField("E-Mail", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
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
                .padding(.top)
                Spacer()
                if authViewModel.loginFailed {
                    Text("Login failed. Please check your credentials.")
                        .foregroundColor(.red)
                }
                Button {
                    authViewModel.login(email: email, password: password)
                } label: {
                    HStack {
                        if loading {
                            ProgressView()
                        }
                        Text("Login")
                    }
                }
                .disabled(!valid || loading)
            }
            .padding()
            .navigationTitle("Login")
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .environmentObject(AuthViewModel())
        
    }
}
