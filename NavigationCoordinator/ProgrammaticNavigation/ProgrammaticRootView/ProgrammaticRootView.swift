//
//  ProgrammaticRootView.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 1/22/24.
//

import SwiftUI

struct ProgrammaticRootView: View {
    @ObservedObject var viewModel: ProgrammaticRootViewModel

    var body: some View {
        NavigationStack {
            List {
                Button("View all", action: {
                    print("navigate")
                })
                ForEach(viewModel.exampleSentences, id: \.self) { sentence in
                    Text(sentence)
                }
            }
            .navigationTitle("Programmatic Root View")
            .onReceive(AppDelegate.navigateToNotificationDestination) { destination in

            }
        }
    }
}
