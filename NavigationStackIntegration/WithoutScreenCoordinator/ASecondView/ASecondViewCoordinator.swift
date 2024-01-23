//
//  ASecondViewCoordinator.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/29/23.
//

import Foundation
import SwiftUI
import SwiftUIAdditions

class ASecondViewCoordinator: ViewCoordinator {
    var viewModel: ASecondViewModel
    
    init(viewModel: ASecondViewModel) {
        self.viewModel = viewModel
    }
    
    func start() -> some View {
        ASecondView(viewModel: viewModel, coordinator: self)
    }
}
