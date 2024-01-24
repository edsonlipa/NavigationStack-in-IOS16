//
//  ProgrammaticDetailView.swift
//  NavigationStackIntegration
//
//  Created by Edson Lipa on 1/23/24.
//

import SwiftUI

struct ProgrammaticDetailView: View {
    @ObservedObject var viewModel: ProgrammaticDetailViewModel
    @EnvironmentObject var router: NavigationRouter

    var body: some View {
        VStack {
            Text(viewModel.item)
            Text(viewModel.emojis.randomElement() ?? "🌈")
                .font(.largeTitle)
            NavigationLink(value: ProgrammaticScreenCoordinator.Screen.detailView(item: "random item \(Int.random(in: 1...100) )")) {
                Text("Go to a random item")
            }
            .buttonStyle(.bordered)
            Button("Return to root view programaticaly") {
                router.resetNavigation(with: [])
            }
            .buttonStyle(.borderedProminent)

        }
        .navigationTitle("Programmatic Detail View")
    }
}

//#Preview {
//    ProgrammaticDetailView()
//}
