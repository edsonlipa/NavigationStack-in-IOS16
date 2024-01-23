//
//  ARootViewCoordinator.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/28/23.
//

import Foundation
import SwiftUI

class ARootViewCoordinator: ViewCoordinator {
    var viewModel: ARootViewModel
    
    init(viewModel: ARootViewModel) {
        self.viewModel = viewModel
    }
    
    @ViewBuilder
    func start() -> some View {
        ARootView(viewModel: viewModel, coordinator: self)
    }
    
    @ViewBuilder
    func aFirstView() -> some View {
        let viewModel = AFirstViewModel()
        let coordinator = AFirstViewCoordinator(viewModel: viewModel)
        coordinator.start()
    }
}

extension ARootViewCoordinator: Navigator {
    enum Destination {
        case AFirstView
    }
    
    func view(for destination: Destination) -> some View {
        switch destination {
        case .AFirstView:
            self.aFirstView()
        }
    }
}
