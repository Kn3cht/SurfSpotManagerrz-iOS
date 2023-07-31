//
//  View+Border.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI

struct Bordered: ViewModifier {
    
    var backgroundColor: Color? = nil
    var borderColor: Color? = nil
    
    func body(content: Content) -> some View {
        content
            .padding()
            .if(backgroundColor != nil) { view in
                    view.background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(backgroundColor!)
                            .foregroundColor(.gray)
                    )
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .foregroundColor(borderColor != nil ? borderColor! : .gray)
                    .shadow(radius: 12)
            )
    }
}

// MARK: - conditional view modifiers
extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
