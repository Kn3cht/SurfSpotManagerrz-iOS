//
//  Authorization.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI

struct Authorization: View {
    
    @State var loginVisible: Bool = false
    @State var registrationVisible: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding(.top)
                Text("Apollo client boilerplate")
                    .foregroundColor(.primary)
                    .frame(alignment: .center)
                    .font(.title)
                
                Spacer()
                Button {
                    loginVisible.toggle()
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .modifier(Bordered(backgroundColor: .blue))
                }
                Button {
                    registrationVisible.toggle()
                } label: {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .modifier(Bordered())
                }
            }
            .sheet(isPresented: $registrationVisible) {
                Registration()
            }
            .sheet(isPresented: $loginVisible) {
                Login()
            }
            .navigationTitle("SurfSpotManagerrz")
            .padding()
        }
    }
}

struct Authorization_Previews: PreviewProvider {
    static var previews: some View {
        Authorization()
    }
}
