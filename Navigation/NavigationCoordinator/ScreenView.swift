//
//  ScreenView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 31.03.2025.
//

import SwiftUI

struct ScreenView: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    @Environment(\.dismiss) private var dismiss

    let screen: Screen?
    let level: Int

    @State private var isNavigationLinkActive: Bool = false
    @State private var cachedNextScreen: Screen?

    private var nextScreen: Screen? {
        if coordinator.screens.count > level + 1 {
            coordinator.screens[level + 1]
        } else if let cachedNextRoute = cachedNextScreen {
            cachedNextRoute
        } else {
            nil
        }
    }

    var body: some View {
        Group {
            switch screen {
            case .home:
                HomeView()
            case .profile:
                ProfileView()
            case .profileDetail:
                ProfileDetailView()
            case .profileSubDetail:
                ProfileSubDetailView()
            case .settings:
                SettingsView()
            case .settingsDetail:
                SettingsDetailView()
            default:
                EmptyView()
            }
        }
        .background {
            NavigationLink(
                destination: ScreenView(
                    screen: nextScreen,
                    level: level + 1
                ),
                isActive: $isNavigationLinkActive,
                label: { EmptyView() }
            )
            .hidden()
        }
        .onChange(of: coordinator.screens) { newValue in
            let oldIsNavigationLinkActive = isNavigationLinkActive
            isNavigationLinkActive = newValue.count > level + 1
            if !oldIsNavigationLinkActive, isNavigationLinkActive {
                cachedNextScreen = newValue.last
            }
            if newValue.count < level + 1 {
                dismiss()
            }
        }
        .onChange(of: isNavigationLinkActive) { newValue in
            if !newValue {
                coordinator.popToLevel(level)
                cachedNextScreen = nil
            }
        }
    }
}
