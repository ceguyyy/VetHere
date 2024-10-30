//
//  VetNameView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

struct VetNameView: View {
    var vetName: String
    
    var body: some View {
        Text(vetName)
            .font(.system(size: 22, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color("TextColor"))
    }
}

#Preview {
    VetNameView(vetName: "Alongside")
}
