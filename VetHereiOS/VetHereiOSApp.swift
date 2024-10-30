//
//  VetHereiOSApp.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 22/10/24.
//

import Combine
import SwiftUI

@main
struct VetHereiOSApp: App {
    @StateObject private var tabBarViewModel = TabBarViewModel()

    var body: some Scene {
        WindowGroup {
            TabBarComponent()
                .environmentObject(tabBarViewModel)
        }
    }
}
