//
//  ScreenCoordinator.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/24/23.
//

import Foundation
import SwiftUIAdditions
import SwiftUI

struct User: Hashable {
    var username: String
    var name: String
    var password: String
}

struct Card: Hashable {
    var user: User?
    var state: String
}

protocol DestinationView: Hashable {}

enum Screen: DestinationView {
    
    case screen1(user: User)
    case screen2
    case screen3
    case screen4
    case screen5
    
    var description: String {
        switch self {
        case .screen1:
            "screen1"
        case .screen2:
            "screen2"
        case .screen3:
            "screen3"
        case .screen4:
            "screen4"
        case .screen5:
            "screen5"
        }
    }
}

final class ScreenCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath() 

    @ViewBuilder 
    private func screen1View(user: User) -> some View {
        let viewModel = Screen1ViewModel(screenCoordinator: self, user: user)
        Screen1View(viewModel: viewModel)
    }
    
    @ViewBuilder
    private func screen2View() -> some View {
        let viewModel = Screen2ViewModel(screenCoordinator: self)

        Screen2View(viewModel: viewModel)
    }
    
    @ViewBuilder
    private func screen3View() -> some View {
        let viewModel = Screen3ViewModel(screenCoordinator: self)
        Screen3View(viewModel: viewModel)
    }
}

extension ScreenCoordinator: Navigator {

    @ViewBuilder func view(for destination: Screen) -> some View {
        switch destination {
        case .screen1(let user):
            LazyView { self.screen1View(user: user) }
        case .screen2:
            LazyView { self.screen2View() }
        case .screen3:
            LazyView { self.screen3View() }
        case .screen4:
            LazyView { self.screen3View() }
        case .screen5:
            LazyView { self.screen3View() }
        }
    }
    
    func navigate(to screen: any DestinationView) {
        navigationPath.append(screen)
    }
    

    func backToRootView() {
        navigationPath = NavigationPath()
    }
}
