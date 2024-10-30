//
//  VetCardViewModel.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import SwiftUI

class VetCardViewModel: ObservableObject {
    @Published var vet: VetModel

    init(vet: VetModel) {
        self.vet = vet
    }

    func handleCardTap() {

        print("Vet Card tapped: \(vet.vetName)")

    }
}

