//
//  DoctorListView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import SwiftUI

struct DoctorListComponent: View {
  var doctors: [DoctorModel]

  var body: some View {
    VStack {
      ForEach(doctors, id: \.id) { doctor in
          DoctorCardComponent(doctor: doctor)
          .padding(4)
      }
      .padding(.horizontal)
    }
  }
}




