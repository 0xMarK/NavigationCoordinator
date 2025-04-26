//
//  HomeView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 30.03.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        VStack(spacing: 20) {
            Button("Go to Profile") {
                coordinator.push(.profile)
            }
            Button("Go to Settings") {
                coordinator.push(.settings)
            }
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomeView()
}
