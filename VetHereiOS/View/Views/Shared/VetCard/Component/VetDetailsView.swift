//
//  VetDetailsView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

struct VetDetailsView: View {
    var vet: VetModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            RatingView(rating: vet.rating)
            
            Text("•")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
            DistanceView(distance: vet.range)
            
            Text("•")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
            ClosingTimeView(closingTime: vet.closingTime)
        }
    }
}

#Preview {
    let sampleVet = VetModel(
        imageName: "vetImage",
        vetName: "Happy Paws Vet Clinic",
        rating: 4,
        range: 3.2,
        closingTime: "7 PM",
        address: "123 Pet Street, Petville",
        doctors: [],
        latitude: "",
        longitude: ""
    )
    
    VetDetailsView(vet: sampleVet)
}
