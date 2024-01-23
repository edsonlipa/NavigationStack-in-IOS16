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
            NavigationLink(value: ProgramaticScreenCoordinator.Screen.rootView) {
                Text("Return to root view with Navigation Link")
            }
            .buttonStyle(.bordered)
            Button("Return to root view programaticaly") {
                router.resetNavigation(with: [])
            }
        }
    }
}

//#Preview {
//    ProgrammaticDetailView()
//}
