//
//  NearbyVetViewDetail.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import SwiftUI
import MapKit

struct NearbyVetDetailView: View {
  var vet: VetModel
    @State private var selectedSegment: DetailEnum = .appointment


  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 4) {
          Image(vet.imageName)
              .resizable()
              .frame(height: 250)
          
          VStack(alignment: .leading, spacing: 4) {
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
          }
        
        Picker("Options", selection: $selectedSegment) {
          ForEach(DetailEnum.allCases) { segment in
            Text(segment.rawValue).tag(segment)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        
       
        Group {
          switch selectedSegment {
          case .appointment:
              DoctorListComponent(doctors: vet.doctors)
          case .information:
              MapAndAddressComponent(vet: vet)
          }
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
    DoctorModel(
      imageName: "doctor", name: "Dr. Holly Williams", specialization: "Animal Surgery",
      rating: 4, phoneNumber: "555-5678"),
    
  ]

  let sampleVet = VetModel(
    imageName: "dog",
    vetName: "Happy Paws Vet Clinic",
    rating: 5,
    range: 2.5,
    closingTime: "6 PM",
    address: "Jalan Jambu",
    doctors: sampleDoctors,
    latitude: "-6.3020781",
    longitude: "106.6522981"
  )

  NearbyVetDetailView(vet: sampleVet)
}
