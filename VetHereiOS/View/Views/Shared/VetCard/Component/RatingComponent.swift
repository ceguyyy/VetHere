//
//  RatingComponent.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import SwiftUI

struct RatingView: View {
    var rating: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 12))
            }
        }
    }
}

#Preview {
        RatingView(rating: 4)
}
