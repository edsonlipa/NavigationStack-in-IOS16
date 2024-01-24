//
//  ARootView.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/28/23.
//

import SwiftUI


struct ARootView: View {
    fileprivate typealias Destination = ARootViewCoordinator.Destination
    
    @ObservedObject var viewModel: ARootViewModel
//    @StateObject var router = Router()
    
    let coordinator: ARootViewCoordinator
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack {
                Text("Root View")
                NavigationLink(value: Destination.AFirstView) {
                    Text("Go to First View")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.cyan)
            .navigationTitle("A Root View")
            .navigationDestination(for: Destination.self) { destination in
                coordinator.view(for: destination)
//                    .environmentObject(router)
            }
        }
    }
}
