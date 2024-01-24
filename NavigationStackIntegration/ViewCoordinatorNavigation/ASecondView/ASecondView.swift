//
//  ASecondView.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/29/23.
//

import SwiftUI

struct ASecondView: View {
    @ObservedObject var viewModel: ASecondViewModel
    let coordinator: ASecondViewCoordinator
    

    var body: some View {
        VStack {
            Text("Second View")
            Button("Do something and then go back to the root") {
                viewModel.doSomethingAndBackToRoot()
            }
            .buttonStyle(.borderedProminent)

        }
        .navigationTitle("Second View")

    }
}
