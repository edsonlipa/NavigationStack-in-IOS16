//
//  AFirstViewCoordinator.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/28/23.
//

import Foundation
import SwiftUIAdditions
import SwiftUI

class AFirstViewCoordinator: ViewCoordinator {
    var viewModel: AFirstViewModel

    init(viewModel: AFirstViewModel) {
        self.viewModel = viewModel
    }

    func start() -> some View {
        AFirstView(viewModel: self.viewModel, coordinator: self)
    }
    
    @ViewBuilder
    private func aSecondView() -> some View {
        let viewModel = ASecondViewModel()
        let coordinator = ASecondViewCoordinator(viewModel: viewModel)
        coordinator.start()
    }
    
    private func aThirdView() -> some View {
        Text("Third View")
            .navigationTitle("Third View")
    }
    
}

extension AFirstViewCoordinator: Navigator {
    enum Destination: Identifiable {

        case secondView
        case thirdView
        
        var id: String {
            String(describing: self)
        }
    }
    
    func view(for destination: Destination) -> some View {
        switch destination {
        case .secondView:
            LazyView { self.aSecondView() }
             
        case .thirdView:
             self.aThirdView()
        }
    }
}

