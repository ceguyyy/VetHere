//
//  DoctorCardView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 29/10/24.
//
import SwiftUI

struct DoctorCardComponent: View {
    let doctor: DoctorModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                DoctorImageView(imageName: doctor.imageName)
                
                DoctorInfoView(
                    name: doctor.name,
                    specialization: doctor.specialization,
                    rating: doctor.rating
                )
                
                Spacer()
                
                DoctorActionsView(
                    onChat: {
                        print("Chat")
                    },
                    onBook: {
                        print("Booked")
                    }
                )
            }
        }
        .frame(width: 361, height: 88)
        .background(Color("ColorDoctorCardBG"))
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


