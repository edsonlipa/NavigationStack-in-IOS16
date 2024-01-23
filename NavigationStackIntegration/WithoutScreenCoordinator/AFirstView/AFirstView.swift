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
    
    @EnvironmentObject var router: Router

    var body: some View {
        let sheetBinding = Binding<AFirstViewCoordinator.Destination?>(
                    get: { [weak viewModel = self.viewModel] in viewModel?.presentedItem },
                    set: { [weak viewModel = self.viewModel] in viewModel?.presentedItem = $0 }
                )
        VStack {
            NavigationLink(value: AFirstViewCoordinator.Destination.secondView) {
                Text("Go to Second View")
            }
            Text("open a sheet")
                .onTapGesture {
                    viewModel.presentedItem = .thirdView
                }
            Button("display navigation path counter") {
                print("first view \(router.navigationPath.count)")
            }

        }
        .navigationTitle("First View")
        .navigationDestination(for: DestinationValue.self) { [weak coordinator = self.coordinator]  destination in
           coordinator?.view(for: destination)
                .environmentObject(router)
        }
        .sheet(item: sheetBinding) { [weak coordinator = self.coordinator]  item in
            coordinator?.view(for: item)
        }
    }
}
