//
//  Tab.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

enum Tab: String, CaseIterable {
    case vet = "Nearby"
    case history = "History"
    case chat = "Chat"
    case myPet = "My Pet"
    
    var systemImage: String {
        switch self {
        case .vet: return "house"
        case .history: return "hourglass"
        case .chat: return "message"
        case .myPet: return "pawprint.circle"
        }
    }
}
