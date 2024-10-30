//
//  ChatView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//
import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = DoctorCardViewModel()

    var body: some View {
        VStack {
            if viewModel.chatInfos.isEmpty {
                Text("No chat information available")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(viewModel.chatInfos) { chatInfo in
                    VStack(alignment: .leading) {
                        Text(chatInfo.doctorName)
                            .font(.headline)
                        Text("Phone: \(chatInfo.phoneNumber)")
                    }
                }
            }
        }
        .navigationTitle("Chat List")
        .frame(maxHeight: .infinity)
        .onAppear {
            viewModel.fetchChatInfos() // Fetch chat info when the view appears
        }
    }
}

#Preview {
    ChatView()
}
