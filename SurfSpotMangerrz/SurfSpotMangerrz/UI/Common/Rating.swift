//
//  Rating.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 01.08.23.
//

import SwiftUI

struct Rating: View {
    
    @Binding var rating: Int?
    var editable: Bool = true

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow

    
    var body: some View {
        
        let internalBinding = Binding<Int>(get: {
            if let rating = rating {
                return rating
            }
                return 0
            }, set: {
                rating = $0
            })

        
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number, rating: internalBinding.wrappedValue)
                    .foregroundColor(number > internalBinding.wrappedValue ? offColor : onColor)
                    .onTapGesture {
                        if editable {
                            internalBinding.wrappedValue = number
                        }
                    }
            }
        }
    }
    
    
    func image(for number: Int, rating: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }

}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        Rating(rating: .constant(4))
    }
}
