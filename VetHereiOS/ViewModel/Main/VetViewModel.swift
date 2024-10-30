//
//  VetViewModel.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import SwiftUI
import Combine

class VetViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var vets: [VetModel] = []

    init() {
        fetchVets()
    }

    func fetchVets() {
        // Mock data for doctors unique to each vet
        let doctorsForVet1: [DoctorModel] = [
            DoctorModel(imageName: "doctor", name: "Dr. Alice Smith", specialization: "Veterinary Surgeon", rating: 5, phoneNumber: "555-1234"),
            DoctorModel(imageName: "doctor", name: "Dr. Bob Johnson", specialization: "Animal Nutritionist", rating: 4, phoneNumber: "555-5678")
        ]

        let doctorsForVet2: [DoctorModel] = [
            DoctorModel(imageName: "doctor", name: "Dr. Carol Lee", specialization: "Veterinary Oncologist", rating: 5, phoneNumber: "555-8765"),
            DoctorModel(imageName: "doctor", name: "Dr. David Brown", specialization: "Emergency Veterinarian", rating: 5, phoneNumber: "555-9999")
        ]

        let doctorsForVet3: [DoctorModel] = [
            DoctorModel(imageName: "doctor", name: "Dr. Emily White", specialization: "Veterinary Dermatologist", rating: 4, phoneNumber: "555-1111"),
            DoctorModel(imageName: "doctor", name: "Dr. Frank Miller", specialization: "Veterinary Surgeon", rating: 4, phoneNumber: "555-2222")
        ]

        self.vets = [
            VetModel(
                imageName: "dog",
                vetName: "Happy Paws Vet Clinic",
                rating: 5,
                range: 2.5,
                closingTime: "6 PM",
                address: "Jl. Grand Boulevard, BSD Green Office Park 9, BSD City, Sampora, Kec. Cisauk, Kabupaten Tangerang, Banten 15345",
                doctors: doctorsForVet1, // Unique doctors for this vet
                latitude: "-6.3020781",
                longitude: "106.6522981"

            ),
            VetModel(
                imageName: "vet",
                vetName: "Whiskers Vet Care",
                rating: 4,
                range: 3.0,
                closingTime: "5 PM",
                address: "Jl. Grand Boulevard, BSD Green Office Park 9, BSD City, Sampora, Kec. Cisauk, Kabupaten Tangerang, Banten 15345",
                doctors: doctorsForVet2 , // Unique doctors for this vet
                latitude: "-6.3020781",
                longitude: "106.6522981"// Unique doctors for this vet
            ),
            VetModel(
                imageName: "vet",
                vetName: "Paws & Claws Animal Hospital",
                rating: 4,
                range: 4.0,
                closingTime: "7 PM",
                address: "Jl. Grand Boulevard, BSD Green Office Park 9, BSD City, Sampora, Kec. Cisauk, Kabupaten Tangerang, Banten 15345",
                doctors: doctorsForVet3 , // Unique doctors for this vet
                latitude: "-6.3020781",
                longitude: "106.6522981"// Unique doctors for this vet
            )
        ]
    }

    func createVet(vet: VetModel) {
        vets.append(vet)
    }

    func updateVet(updatedVet: VetModel) {
        if let index = vets.firstIndex(where: { $0.id == updatedVet.id }) {
            vets[index] = updatedVet
        }
    }

    func deleteVet(vetId: UUID) {
        vets.removeAll { $0.id == vetId }
    }

    var filteredVets: [VetModel] {
        if searchText.isEmpty {
            return vets
        } else {
            return vets.filter { vet in
                vet.vetName.lowercased().contains(searchText.lowercased())
            }
        }
    }

    // Function to add a doctor to a vet
    func addDoctor(to vetId: UUID, doctor: DoctorModel) {
        if let index = vets.firstIndex(where: { $0.id == vetId }) {
            vets[index].doctors.append(doctor)
        }
    }

    // Function to get doctors for a specific vet
    func getDoctors(for vetId: UUID) -> [DoctorModel]? {
        return vets.first(where: { $0.id == vetId })?.doctors
    }
}
