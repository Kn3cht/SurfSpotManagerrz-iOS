//
//  Login.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State var email: String = "asdf"
    @State var password: String = "asdf"
    
    var body: some View {
        VStack {
            TextField("E-Mail", text: $email)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .modifier(Bordered())
            TextField("Password", text: $password)
                .modifier(Bordered())
            HStack {
                Spacer()
                Button {
                    authViewModel.login(email: email, password: password)
                } label: {
                    Text("Login")
                }
                .disabled(email.isEmpty || password.isEmpty)
            }
            .padding(.top)

            Spacer()
        }
        .padding()
        .navigationTitle("Login")
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Login()
                .environmentObject(AuthViewModel())
        }
    }
}
