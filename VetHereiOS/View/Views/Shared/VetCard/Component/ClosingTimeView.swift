//
//  ClosingTimeView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import SwiftUI

struct ClosingTimeView: View {
    var closingTime: String
    
    var body: some View {
        HStack {
            Image(systemName: "clock.fill")
            Text("Until \(closingTime)")
                .font(.system(size: 12))
        }
    }
}

#Preview {
    ClosingTimeView(closingTime: "5")
}
