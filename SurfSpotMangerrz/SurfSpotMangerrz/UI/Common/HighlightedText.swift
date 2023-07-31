//
//  HighlightedText.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import SwiftUI

struct HighlightedText: View {
    
    let text: String
    let query: String?
    
    init(_ text: String, query: String?) {
        self.text = text
        self.query = query
    }
    
    var body: some View {
        Text(attributedString)
    }
    
    private var attributedString: AttributedString {
        var attributedString = AttributedString(text)
        
        if let query = query, let range = AttributedString(text.lowercased()).range(of: query.lowercased()) {
            attributedString[range].foregroundColor = Color(.orange)
            attributedString[range].underlineStyle = .single
        }

        return attributedString
    }
}
