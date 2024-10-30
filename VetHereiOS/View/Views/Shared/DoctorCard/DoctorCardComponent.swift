//
//  DoctorCardView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 29/10/24.
//
import SwiftUI

struct DoctorCardComponent: View {
    let doctor: DoctorModel
    @StateObject private var viewModel = DoctorCardViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(doctor.imageName)
                    .resizable()
                    .frame(width: 88, height: 88)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 4) {
                    Text(doctor.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(doctor.specialization)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    RatingView(rating: doctor.rating)
                }
                
                Spacer()
                
                DoctorActionsView(
                    onChat: {
                        openWhatsApp(phoneNumber: "\(doctor.phoneNumber)", message: "\(doctor.name)")
                        
                        viewModel.addChatInfo(doctor: doctor)
                    },
                    onBook: {
                        print("\(doctor.name) Booked")
                    }
                )
            }
        }
        .frame(width: 361, height: 88)
        .background(Color("ColorCard"))
        .cornerRadius(10)
    }
}

#Preview {
    let sampleDoctor = DoctorModel(
        imageName: "doctor",
        name: "Dr. John Doe",
        specialization: "General Practitioner",
        rating: 5,
        phoneNumber: "+91 9876543210"
    )
    DoctorCardComponent(doctor: sampleDoctor)
}


