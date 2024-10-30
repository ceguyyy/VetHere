//
//  SwiftUIView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 22/10/24.
//
import SwiftUI



struct VetCardComponent: View {
    @StateObject var viewModel: VetCardViewModel
    
    var body: some View {
          NavigationLink(destination: NearbyVetDetailView(vet: viewModel.vet)) {
              VStack(alignment: .leading) {
                  VetImageView(imageName: viewModel.vet.imageName)
                  VStack(alignment: .leading, spacing: 8) {
                      VetNameView(vetName: viewModel.vet.vetName)
                      VetDetailsView(vet: viewModel.vet)
                      VetAddressView(address: viewModel.vet.address)
                  }
                  .padding()
              }
              .foregroundColor(Color("TextColor"))
              .background(Color("ColorCard"))
              .frame(width: 361)
              .clipShape(RoundedRectangle(cornerRadius: 10))
          }
          .buttonStyle(PlainButtonStyle())
      }
  }

#Preview {

    let sampleDoctors = [
        DoctorModel(imageName: "doctor", name: "Dr. Alice Smith", specialization: "Veterinary Surgeon", rating: 5, phoneNumber: "555-1234"),
        DoctorModel(imageName: "doctor", name: "Dr. Bob Johnson", specialization: "Animal Nutritionist", rating: 4, phoneNumber: "555-5678")
    ]

    let sampleVet = VetModel(
        imageName: "dog",
        vetName: "Happy Paws Vet Clinic",
        rating: 5,
        range: 2.5,
        closingTime: "6 PM",
        address: "Friendly and experienced veterinarians available for your petskdfnasidnaksjdnikashjdiasjdiasjdiasjdoiajdoiajdoasjdoasjdosajdoasj.",
        doctors: sampleDoctors,
        latitude: "-6.3020781",
        longitude: "106.6522981"
    )

    let viewModel = VetCardViewModel(vet: sampleVet)
    VetCardComponent(viewModel: viewModel)
}
