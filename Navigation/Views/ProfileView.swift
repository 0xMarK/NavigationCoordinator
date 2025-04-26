//
//  ProfileView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 30.03.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        VStack(spacing: 20) {
            Text("Profile View")
                .font(.largeTitle)
            Button("Go to Profile Details") {
                coordinator.push(.profileDetail)
            }
            Button("Back") {
                coordinator.pop()
            }
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    ProfileView()
}
