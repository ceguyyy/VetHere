//
//  ChatModel.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import Foundation

struct ChatModel: Identifiable {
    let id = UUID() // Unique identifier
    let doctorName: String
    let phoneNumber: String
    let timestamp: Date
    let image: String
}
