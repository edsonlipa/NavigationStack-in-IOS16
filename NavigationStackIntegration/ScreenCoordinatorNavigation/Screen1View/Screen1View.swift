//
//  Screen1View.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/26/23.
//

import SwiftUI

struct Screen1View: View {
    @ObservedObject var viewModel: Screen1ViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.teal
            
            VStack {
                Text(viewModel.user.name)
                Text(viewModel.mainText)
                Button(action: {
                    viewModel.navigate(to: .screen1(user: .init(username: "elipa", name: "Edson", password: "pass")))
                },
                       label: { Text("Go to first View") })
                .buttonStyle(.borderedProminent)

                Button(action: { viewModel.navigate(to: .screen2)},
                       label: { Text("Go to second View") })
                .buttonStyle(.borderedProminent)
                
                Button(action: { viewModel.navigate(to: .screen3)},
                       label: { Text("Go to third View") })
                    .padding(.bottom)
                    .buttonStyle(.borderedProminent)

                Divider()

                Button(action: { viewModel.navigate(to: .screen3)},
                       label: { Text("Go to third View") })
                    .padding(.bottom)
                    .buttonStyle(.borderedProminent)

                
                Divider()

                Button(action: {dismiss()},
                       label: { Text("Back with [Environment dismiss]") })
                .buttonStyle(.borderedProminent)

                Button(action: { viewModel.backToRootView()},
                       label: { Text("Back to root view") })
                .buttonStyle(.borderedProminent)

            }
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
