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

struct TabBarComponent: View {
    @EnvironmentObject var viewModel: TabBarViewModel

    var body: some View {
        
        
        TabView(selection: $viewModel.selectedTab) {
            NearbyVetView()
                .tabItem {
                    Label(Tab.vet.rawValue, systemImage: Tab.vet.systemImage)
                }
                .tag(Tab.vet)
            
            HistoryView()
                .tabItem {
                    Label(Tab.history.rawValue, systemImage: Tab.history.systemImage)
                }
                .tag(Tab.history)
            
            ChatView()
                .tabItem {
                    Label(Tab.chat.rawValue, systemImage: Tab.chat.systemImage)
                }
                .tag(Tab.chat)
            
            MyPetView()
                .tabItem {
                    Label(Tab.myPet.rawValue, systemImage: Tab.myPet.systemImage)
                }
                .tag(Tab.myPet)
        }
    }
}
