//
//  ContentView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tabBarViewModel = TabBarViewModel()

    var body: some View {
        TabBarComponent()
            .environmentObject(tabBarViewModel)
    }
}

#Preview {
    ContentView()
}
