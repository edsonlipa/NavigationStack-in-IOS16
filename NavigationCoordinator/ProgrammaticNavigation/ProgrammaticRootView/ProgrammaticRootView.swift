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

            Button("View all", action: {
                print("navigate")
            })
            List {
                ForEach(viewModel.exampleSentences, id: \.self) { sentence in
                    Text(sentence)
                }
            }
            .navigationTitle("Programmatic Root View")
        }

    }
}

//#Preview {
//    ProgrammaticRootView()
//}
