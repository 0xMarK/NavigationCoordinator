# NavigationCoordinator

Everyone who tried to use SwiftUI’s `NavigationView` in a big production level app faced a problem navigating using a standard `NavigationView`. Of course the `NavigationStack` fixes the problem, but what if you can’t use `NavigationStack` because it is not available pre iOS 16?

With `NavigationView` you have to have a `NavigationLink` in your current `View` to navigate to a next `View`. So you have to put a `NavigationLink` with specific `View` in order to navigate there. When using a `ViewModel` you can’t just call `push(NextView())` to show the `NextView`. You have to activate the `NavigationLink` which has to be in your current `View` in order to show the `NextView`. It is ok if you have a simple app which has exact hierarchy of views, but if you have a complicated dynamic routes such approach becomes painful.

It would be better to have a solution when you can just say which view you want to navigate to without putting all possible `NavigationLink`s into current view. In this case my solution comes in handy.

You just write:

```swift
coordinator.push(.profile)
```

And `NavigationView` pushes the `ProfileView` on to the stack. All you need is to add case profile to `enum Screen` and add `ProfileView()` into `ScreenView`. This way `NavigationCoordinator` will be able to push `ProfileView` onto the navigation stack without any more efforts.

The basic example is:

```swift
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
```

This is how `HomeView` looks like:

```swift
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
```

**That’s it!** You can now build a complicated hierarchy of navigation in your app. And it is compatible with MVVM approach.

![NavigationCoordinator](https://github.com/user-attachments/assets/2c4abfd4-8aa5-46de-8da5-6be2b8a180f5)

## NavigationController alternative

Or you can take my [alternative version](https://github.com/0xMarK/NavigationController) which enables you to specify any `View` to navigate to inline:

```swift
controller.push(ProfileView())
```

But this version relies on `AnyView` which is dangerous. Apple Engineers don’t recommend to use `AnyView` because it has performance issues and may have other unexpected issues. Use `NavigationController` variant cautious.
