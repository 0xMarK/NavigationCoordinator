//
//  ProfileSubDetailView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 30.03.2025.
//

import SwiftUI

struct ProfileSubDetailView: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        VStack(spacing: 20) {
            Text("Profile Sub Detail View")
                .font(.largeTitle)
            Button("Back") {
                coordinator.pop()
            }
            Button("Pop to Root") {
                coordinator.popToRoot()
            }
        }
        .navigationTitle("Profile Sub Detail")
    }
}

#Preview {
    ProfileSubDetailView()
}
