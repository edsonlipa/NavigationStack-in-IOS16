//
//  AFirstRootView.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/28/23.
//

import SwiftUI

struct AFirstView: View {
    typealias DestinationValue = AFirstViewCoordinator.Destination

    @ObservedObject var viewModel: AFirstViewModel
    let coordinator: AFirstViewCoordinator

    var body: some View {
        VStack {
            NavigationLink(value: AFirstViewCoordinator.Destination.secondView) {
                Text("Go to Second View")
            }
            Text("open a sheet")
                .onTapGesture {
                    viewModel.presentedItem = .thirdView
                }
            Button("display navigation path counter") {
                print("first view ")
            }

        }
        .navigationTitle("First View")
        .navigationDestination(for: DestinationValue.self) { destination in
           coordinator.view(for: destination)
        }
        .sheet(item: $viewModel.presentedItem) { item in
            coordinator.view(for: item)
        }
    }
}
