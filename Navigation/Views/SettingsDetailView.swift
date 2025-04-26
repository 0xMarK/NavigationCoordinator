//
//  SettingsDetailView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 30.03.2025.
//

import SwiftUI

struct SettingsDetailView: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings Detail View")
                .font(.largeTitle)
            Button("Back") {
                coordinator.pop()
            }
            Button("Pop to Root") {
                coordinator.popToRoot()
            }
        }
        .navigationTitle("Settings Detail")
    }
}

#Preview {
    SettingsDetailView()
}
