//
//  SwiftUIView.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/27/23.
//

import SwiftUI

struct Screen2View: View {
    @ObservedObject var viewModel: Screen2ViewModel
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.indigo
            
            VStack {
                Text(viewModel.mainText)
                Button(action: {
                    viewModel.navigate(to: Screen.screen1(user: .init(username: "elipa", name: "Edson", password: "pass")))
                },
                       label: { Text("Go to first View") })
                .buttonStyle(.borderedProminent)

                Button(action: { viewModel.navigate(to: Screen.screen2)},
                       label: { Text("Go to second View") })
                .buttonStyle(.borderedProminent)

                Button(action: { viewModel.navigate(to: Screen.screen3)},
                       label: { Text("Go to third View") })
                .buttonStyle(.borderedProminent)

                    .padding(.bottom)
                
                Divider()
                Button(action: {dismiss()},
                       label: { Text("Back with [Environment dismiss]") })
                .buttonStyle(.borderedProminent)

                Button(action: { viewModel.backToRootView()},
                       label: { Text("Back to root view") })
                    .padding(.bottom)
                    .buttonStyle(.borderedProminent)

                

            }
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}
