//
//  ViewRouter.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 31/10/24.
//
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentRoute: AppRoute = .nearbyVets
    
    func navigate(to route: AppRoute) {
        currentRoute = route
    }
}
