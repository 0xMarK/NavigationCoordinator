//
//  NavigationApp.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 04.03.2025.
//

import SwiftUI

@main
struct NavigationApp: App {
    @StateObject var coordinator = NavigationCoordinator(rootScreen: .home)

    var body: some Scene {
        WindowGroup {
            NavigationView {
                coordinator.rootView
            }
            .environmentObject(coordinator)
        }
    }
}
