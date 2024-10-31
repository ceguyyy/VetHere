//
//  DoctorListView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//
//
import SwiftUI

struct DoctorListComponent: View {
        @State private var isNavigationActive = false
        @StateObject private var router = ViewRouter()
        var doctors: [DoctorModel]
        @StateObject private var viewModel = DoctorCardViewModel()
  
        var body: some View {
            NavigationStack{
            VStack {
                ForEach(doctors, id: \.id) { doctor in
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Image(doctor.imageName)
                                .resizable()
                                .frame(width: 88, height: 88)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(doctor.name)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text(doctor.specialization)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                RatingView(rating: doctor.rating)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Button(action: {
                                    openWhatsApp(phoneNumber: "\(doctor.phoneNumber)", message: "\(doctor.name)")
                                    viewModel.addChatInfo(doctor: doctor)
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color.gray)
                                            .frame(width: 60, height: 24)
                                            .cornerRadius(10)
                                        
                                        Text("Chat")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                    }
                                }
                                
                                Button(action: {
                                    router.navigate(to: .booking(doctor))
                                    isNavigationActive = true
                                    
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color.gray)
                                            .frame(width: 60, height: 24)
                                            .cornerRadius(10)
                                        
                                        Text("Book")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(width: 361, height: 88)
                    .background(Color("ColorCard"))
                    .cornerRadius(10)
                    .padding(4)
                }
                .padding(.horizontal)
            }
            .background(
                NavigationLink(destination: RouteViewBuilder.destinationView(for: router.currentRoute), isActive: $isNavigationActive) {
                    EmptyView()
                }
                .hidden()
            )
        }
    }
}

