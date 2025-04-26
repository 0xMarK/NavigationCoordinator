//
//  SettingsView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 30.03.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings View")
                .font(.largeTitle)
            Button("Go to Settings Details") {
                coordinator.push(.settingsDetail)
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
