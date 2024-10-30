//
//  DoctorInfoView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

struct DoctorInfoView: View {
    let name: String
    let specialization: String
    let rating: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(specialization)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            RatingView(rating: rating)
        }
    }
}
