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
    @StateObject private var router = ViewRouter()
    @State private var isNavigationActive = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.filteredVets) { vet in
                        Button(action: {
                            router.navigate(to: .vetDetail(vet))
                            isNavigationActive = true
                        }) {
                            VetCardComponent(viewModel: VetCardViewModel(vet: vet))
                        }
                    }
                }
            }
            .searchable(text: $viewModel.searchText, prompt: "Search for vets")
            .navigationTitle(tabBarViewModel.currentTabTitle)
            .navigationBarItems(trailing:
                Button(action: {
                    router.navigate(to: .profile)
                    isNavigationActive = true
                }) {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
            )
            
            .background(
                NavigationLink(destination: RouteViewBuilder.destinationView(for: router.currentRoute), isActive: $isNavigationActive) {
                    EmptyView()
                }
                .hidden()
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
