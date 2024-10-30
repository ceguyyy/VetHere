//
//  TabBarViewModel.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import Combine

class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .vet
    
    var currentTabTitle: String {
        selectedTab.rawValue 
    }
}


