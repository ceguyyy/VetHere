//
//  VetAddressView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

struct VetAddressView: View {
    var address: String
    
    var body: some View {
        Text(address)
            .font(.system(size: 13))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color("TextColor"))
    }
}

#Preview {
    VetAddressView(address: "1234 Main St, Anytown, USA")
}
