//
//  ChatViewModel.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import SwiftUI
import Combine


// Define the view model for managing doctor chat data
class DoctorCardViewModel: ObservableObject {
    @Published var doctor: DoctorModel?
    @Published var chatInfos: [ChatModel] = []

    func addChatInfo(doctor: DoctorModel) {
        let newChatInfo = ChatModel(
            doctorName: doctor.name,
            phoneNumber: doctor.phoneNumber,
            timestamp: Date(),
            image: doctor.imageName
        )
        chatInfos.append(newChatInfo)
    }

    func fetchChatInfos() {
        chatInfos = [
            ChatModel(doctorName: "Dr. Smith", phoneNumber: "555-1234", timestamp: Date(), image: "doctor1"),
            ChatModel(doctorName: "Dr. Johnson", phoneNumber: "555-5678", timestamp: Date(), image: "doctor2"),
            ChatModel(doctorName: "Dr. Williams", phoneNumber: "555-8765", timestamp: Date(), image: "doctor3"),
            ChatModel(doctorName: "Dr. Brown", phoneNumber: "555-4321", timestamp: Date(), image: "doctor4"),
            ChatModel(doctorName: "Dr. Garcia", phoneNumber: "555-3456", timestamp: Date(), image: "doctor5")
        ]
    }
}
