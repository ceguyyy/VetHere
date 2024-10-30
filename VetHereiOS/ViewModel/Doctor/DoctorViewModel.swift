//
//  DoctorViewModel.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import Foundation

class DoctorViewModel: ObservableObject {
    @Published var doctors: [DoctorModel] = []
    
    init() {
        loadDoctors()
    }
    
    private func loadDoctors() {
        doctors = [
            DoctorModel(
                imageName: "doctor",
                name: "Dr. Alice Smith",
                specialization: "Veterinary Surgeon",
                rating: 5,
                phoneNumber: "555-1234"
            ),
            DoctorModel(
                imageName: "doctor",
                name: "Dr. Bob Johnson",
                specialization: "Animal Nutritionist",
                rating: 4,
                phoneNumber: "555-5678"
            )
        ]
    }
    
    // Create
    func addDoctor(_ doctor: DoctorModel) {
        doctors.append(doctor)
    }
    
    // Read
    func getDoctor(byName name: String) -> DoctorModel? {
        return doctors.first { $0.name == name }
    }
    
    // Update
    func updateDoctor(name: String, with updatedDoctor: DoctorModel) {
        if let index = doctors.firstIndex(where: { $0.name == name }) {
            doctors[index] = updatedDoctor
        }
    }
    
    // Delete
    func deleteDoctor(name: String) {
        doctors.removeAll { $0.name == name }
    }
}
