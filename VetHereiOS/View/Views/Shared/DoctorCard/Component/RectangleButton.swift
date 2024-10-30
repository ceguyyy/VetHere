//
//  RectangleButton.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

struct RectangleButton: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width: 60, height: 24)
                    .cornerRadius(10)
                
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
        }
    }
}

#Preview {
    RectangleButton(text: "Sample", action: { print("Button pressed") })
}
