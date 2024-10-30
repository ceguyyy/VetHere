//
//  NearbyVetViewDetail.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import MapKit
import SwiftUI

struct NearbyVetDetailView: View {
  var vet: VetModel
  @State private var selectedSegment = 0
  let segments = ["Appointment", "Information"]

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 4) {
        Image(vet.imageName)
          .resizable()
          .scaledToFit()
          .frame(height: 250)
          .clipShape(RoundedRectangle(cornerRadius: 10))

        Text(vet.vetName)
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(.horizontal)

        Text("\(vet.range, specifier: "%.1f") Km away")
          .font(.subheadline)
          .foregroundColor(.gray)
          .padding(.horizontal)

        Text("Open \(vet.closingTime)")
          .font(.subheadline)
          .foregroundColor(.gray)
          .padding(.horizontal)

        Picker("Options", selection: $selectedSegment) {
          ForEach(0..<segments.count) { index in
            Text(segments[index])
              .tag(index)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()

        if selectedSegment == 0 {
          ForEach(vet.doctors, id: \.id) { doctor in
            DoctorCardComponent(doctor: doctor).padding(4)
          }.padding(.horizontal)
        } else if selectedSegment == 1 {
          VStack {
            if let latitude = Double(vet.latitude), let longitude = Double(vet.longitude) {
              MapComponent(latitude: latitude, longitude: longitude)
                .frame(height: 300)
                .padding(.horizontal)
                .cornerRadius(10)

            } else {
              Text("Invalid coordinates")
                .foregroundColor(.red)
                .padding()
            }

          }
          Spacer()

          Text("\(vet.address)")

            .padding(.horizontal)

        }
      }
    }
    .navigationTitle(vet.vetName)
    .navigationBarTitleDisplayMode(.inline)
  }

}

#Preview {
  let sampleDoctors = [
    DoctorModel(
      imageName: "doctor", name: "Dr. Alice Smith", specialization: "Veterinary Surgeon", rating: 5,
      phoneNumber: "555-1234"),
    DoctorModel(
      imageName: "doctor", name: "Dr. Bob Johnson", specialization: "Animal Nutritionist",
      rating: 4, phoneNumber: "555-5678"),
  ]

  let sampleVet = VetModel(
    imageName: "dog",
    vetName: "Happy Paws Vet Clinic",
    rating: 5,
    range: 2.5,
    closingTime: "6 PM",
    address: "Friendly and experienced veterinarians available for your pets.",
    doctors: sampleDoctors,
    latitude: "-6.3020781",
    longitude: "106.6522981"
  )

  NearbyVetDetailView(vet: sampleVet)
}
