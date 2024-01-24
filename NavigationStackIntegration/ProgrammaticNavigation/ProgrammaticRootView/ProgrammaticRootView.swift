//
//  ProgrammaticRootView.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 1/22/24.
//

import SwiftUI


struct ProgrammaticRootView: View {
    let screenCoordinator = ProgrammaticScreenCoordinator()
    @ObservedObject var viewModel: ProgrammaticRootViewModel
    @StateObject var navigationRouter = NavigationRouter()

    var body: some View {
        NavigationStack(path: $navigationRouter.navigationPath) {
            List {
                Section(content: {
                    ForEach(viewModel.exampleSentences.prefix(4), id: \.self) { item in
                        NavigationLink(value: ProgrammaticScreenCoordinator.Screen.detailView(item: item)) {
                            Text(item)
                        }
                    }
                }, header: {
                    HStack {
                        Text("Today items")
                        Spacer()
                        NavigationLink(value: ProgrammaticScreenCoordinator.Screen.itemList) {
                            Text("View All")
                                .font(.footnote)

                        }
                    }
                })

                Button("navigate to 3 levels") {
                    let newPath: [ProgrammaticScreenCoordinator.Screen] = [.detailView(item: "item 1"), .itemList, .detailView(item: "item 2")]
                    navigationRouter.resetNavigation(with: newPath)
                }
                .buttonStyle(.borderedProminent)
            }

            .navigationTitle("Programmatic Root View")
            .onReceive(AppDelegate.navigateToNotificationDestination) { destination in
                guard let item = destination?.itemID else { return }

                let newPath: [ProgrammaticScreenCoordinator.Screen] = [.itemList, .detailView(item: item)]
                navigationRouter.resetNavigation(with: newPath)
            }
            .navigationDestination(for: ProgrammaticScreenCoordinator.Screen.self) { destination in
                screenCoordinator.view(for: destination)
                    .environmentObject(navigationRouter)
            }
        }
    }
}
