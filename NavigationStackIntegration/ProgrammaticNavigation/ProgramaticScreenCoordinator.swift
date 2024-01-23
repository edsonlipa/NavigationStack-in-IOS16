//
//  ProgramaticScreenCoordinator.swift
//  NavigationStackIntegration
//
//  Created by Edson Lipa on 1/23/24.
//

import Foundation
import SwiftUI

class ProgramaticScreenCoordinator {
    enum Screen: Hashable {
        case rootView
        case itemList
        case detailView(item: String)

        var description: String {
            switch self {
                case .rootView:
                    "Root View"
                case .itemList:
                    "List of Items"
                case .detailView:
                    "Detail of Item"
            }
        }
    }

    @ViewBuilder func view(for destination: Screen) -> some View {
        switch destination {
            case .rootView:
                rootView()
            case .itemList:
                itemList()
            case .detailView(let item):
                detailView(item: item)
        }
    }

    @ViewBuilder func rootView() -> some View {
        let viewModel = ProgrammaticRootViewModel()
        ProgrammaticRootView(viewModel: viewModel)
    }

    @ViewBuilder func itemList() -> some View {
        let viewModel = ProgrammaticListViewModel()
        ProgrammaticListView(viewModel: viewModel)
    }

    @ViewBuilder func detailView(item: String) -> some View {
        let viewModel = ProgrammaticDetailViewModel(item: item)
        ProgrammaticDetailView(viewModel: viewModel)
    }
}
