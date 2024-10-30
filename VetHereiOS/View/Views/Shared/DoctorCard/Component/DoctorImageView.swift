//
//  DoctorImageView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

struct DoctorImageView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 88, height: 88)
            .cornerRadius(10)
    }
}
