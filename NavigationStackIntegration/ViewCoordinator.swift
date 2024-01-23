//
//  ViewCoordinator.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 1/22/24.
//

import SwiftUI

public protocol ViewCoordinator {
    associatedtype ViewContent
    @ViewBuilder func start() -> ViewContent
}

public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

public protocol EventHandler {
    associatedtype EventType
    func send(_ event: EventType)
    func sendAsync(_ event: EventType) async
}

public extension EventHandler {
    func send(_ event: EventType) {
        fatalError("Implementation of 'send(_ event)' needs to be implemented in the conforming class")
    }

    func sendAsync(_ event: EventType) async {
        fatalError("Implementation of 'send(_ event) async' needs to be implemented in the conforming class")
    }
}

public protocol Navigator {
    associatedtype NavigationDestination
    associatedtype NavigationContent
    @ViewBuilder func view(for destination: NavigationDestination) -> NavigationContent
}

public extension Navigator {
    @ViewBuilder func view(for destination: DefaultDestination) -> some View {
        Text("Implementation of view(for:) needs to be implemented in the conforming class")
    }
}

public enum DefaultDestination {
    case defaultImplementation
}

public struct LazyView<LazyContent: View>: View {
    @ViewBuilder private var build: () -> LazyContent

    public var body: some View {
        build()
    }

    public init(@ViewBuilder build: @escaping () -> LazyContent) {
        self.build = build
    }
}
