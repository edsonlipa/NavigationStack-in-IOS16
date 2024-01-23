//
//  ContentView.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RootViewWithScreenCoordinator
                .tabItem {
                    Label("example 1", systemImage: "arrow.up.heart")
                }
            RootViewWithRouter
                .tabItem {
                    Label("example 2", systemImage: "arrow.up.message")
                }
            ProgrammaticNavigation
                .tabItem {
                    Label("example 3", systemImage: "arrow.up.square")
                }
        }

    }
    
    @ViewBuilder private var RootViewWithScreenCoordinator: some View {
        let screenCoordinator = ScreenCoordinator()
        RootView(screenCoordinator: screenCoordinator)
    }
    
    @ViewBuilder private var RootViewWithRouter: some View {
        let viewModel = ARootViewModel()
        let coordinator = ARootViewCoordinator(viewModel: viewModel)
        coordinator.start()
    }

    @ViewBuilder private var ProgrammaticNavigation: some View {
        let viewModel = ProgrammaticRootViewModel()
        ProgrammaticRootView(viewModel: viewModel)
    }
}
