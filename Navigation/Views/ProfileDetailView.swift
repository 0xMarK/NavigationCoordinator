//
//  ProfileDetailView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 30.03.2025.
//

import SwiftUI

struct ProfileDetailView: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        VStack(spacing: 20) {
            Text("Profile Detail View")
                .font(.largeTitle)
            Button("Go to Profile Sub Details") {
                coordinator.push(.profileSubDetail)
            }
            Button("Back") {
                coordinator.pop()
            }
        }
        .navigationTitle("Profile Detail")
    }
}

#Preview {
    ProfileDetailView()
}
