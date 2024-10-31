//
//  BookingView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 31/10/24.
//

import SwiftUI

struct BookingView: View {
    var doctor: DoctorModel
//    var vet: VetModel
    var body: some View {
        NavigationStack{
            Text("Hello\(doctor.name)\n\(doctor.rating)")
//            Text("Hello\(vet.vetName)\n\(vet.rating)")
        }.navigationTitle(doctor.name)
        
    }
}

//#Preview {
//    BookingView(doctor: <#DoctorModel#>)
//}
