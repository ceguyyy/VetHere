//
//  RouteViewBuilder.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 31/10/24.
//


// RouteViewBuilder.swift
// VetHereiOS
//
// Created by Christian Gunawan on 31/10/24.
//

import SwiftUI

struct RouteViewBuilder {
    static func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .nearbyVets:
            AnyView(EmptyView())
        case .vetDetail(let vet):
            AnyView(NearbyVetDetailView(vet: vet))
        case .profile:
            AnyView(ProfileView())
        case .booking(let doctor):
            AnyView(BookingView(doctor: doctor))
        }
    }
}

