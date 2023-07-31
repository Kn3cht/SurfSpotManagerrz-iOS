//
//  Authorization.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI

struct Authorization: View {
    var body: some View {
        VStack {
            Spacer()
            NavigationLink {
                Login()
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .modifier(Bordered(backgroundColor: .blue))
            }
            NavigationLink {
                Registration()
                    
            } label: {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .modifier(Bordered())
            }
        }.padding()
    }
}

struct Authorization_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Authorization()
        }
    }
}
