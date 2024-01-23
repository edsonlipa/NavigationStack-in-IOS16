//
//  NavigationRouter.swift
//  NavigationStackIntegration
//
//  Created by Edson Lipa on 1/23/24.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {
    @Published
    var navigationPath = NavigationPath() {
        didSet {
            print("Router navigationPath size \(navigationPath.count)")
        }
    }

    func navigate(to destination: any Hashable) {
        navigationPath.append(destination)
    }

    func resetNavigation(with destinations: [any Hashable]) {
        navigationPath = NavigationPath()
        destinations.forEach { destination in
            navigationPath.append(destination)
        }
    }
}
