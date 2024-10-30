//
//  NearbyVetView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 29/10/24.
//
import SwiftUI

struct NearbyVetView: View {
    @StateObject private var tabBarViewModel = TabBarViewModel()
    @StateObject private var viewModel = VetViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading,spacing: 16) {
                    ForEach(viewModel.filteredVets) { vet in
                        NavigationLink(destination: NearbyVetDetailView(vet: vet)) {
                            VetCardComponent(viewModel: VetCardViewModel(vet: vet))
                        }
                    }
                }
            }
            .searchable(text: $viewModel.searchText, prompt: "Search for vets")
            .navigationTitle(tabBarViewModel.currentTabTitle)
            .navigationBarItems(trailing:
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
            )
        }
        .onChange(of: tabBarViewModel.selectedTab) { _ in
            UINavigationBar.appearance().topItem?.title = tabBarViewModel.currentTabTitle
        }
    }
}

#Preview {
    NearbyVetView()
}
