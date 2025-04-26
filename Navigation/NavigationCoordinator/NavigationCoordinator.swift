//
//  NavigationCoordinator.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 31.03.2025.
//

import SwiftUI

class NavigationCoordinator: ObservableObject {

    @Published private(set) var screens: [Screen]

    var rootView: some View {
        ScreenView(screen: screens.first, level: 0)
    }

    init(rootScreen: Screen) {
        self.screens = [rootScreen]
    }

    func push(_ route: Screen) {
        screens.append(route)
    }

    func pop() {
        guard screens.count > 1 else { return }
        _ = screens.popLast()
    }

    func popToRoot() {
        screens = [screens[0]]
    }

    func popToLevel(_ level: Int) {
        if screens.count > level + 1 {
            screens = Array(screens.prefix(level + 1))
        }
    }
}
