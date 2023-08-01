//
//  LocationSummary.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 01.08.23.
//

import SwiftUI

struct LocationSummary: View {
    
    var name: String
    var address: String
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .lineLimit(1)
                Spacer()
            }
            HStack {
                Text(address)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.caption)
                Spacer()
            }
        }
    }
}

struct LocationSummary_Previews: PreviewProvider {
    static var previews: some View {
        LocationSummary(name: "test", address: "Sesamstraße 3456, Munich")
    }
}
