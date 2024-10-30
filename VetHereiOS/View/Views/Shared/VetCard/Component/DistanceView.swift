//
//  DistanceView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import SwiftUI

struct DistanceView: View {
    var distance: Double
    
    var body: some View {
        HStack {
            Image(systemName: "map.fill")
            Text("\(distance, specifier: "%.1f") Km")
                .font(.system(size: 12))
        }
    }
}

#Preview {
    VetHereiOS.DistanceView(distance: 100)
}
