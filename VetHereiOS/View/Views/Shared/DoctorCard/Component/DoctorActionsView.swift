//
//  DoctorActionsView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

struct DoctorActionsView: View {
    var onChat: () -> Void
    var onBook: () -> Void
    
    var body: some View {
        VStack(alignment: .trailing) {
            RectangleButton(text: "Chat", action: onChat)
            RectangleButton(text: "Book", action: onBook)
        }
        .padding()
    }
}
