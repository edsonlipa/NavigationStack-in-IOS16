//
//  ProgrammaticListView.swift
//  NavigationStackIntegration
//
//  Created by Edson Lipa on 1/23/24.
//

import SwiftUI

struct ProgrammaticListView: View {
    @ObservedObject var viewModel: ProgrammaticListViewModel
    @EnvironmentObject var router: NavigationRouter

    var body: some View {
        List {
            ForEach(viewModel.exampleSentences, id: \.self) { item in
                NavigationLink(value: ProgramaticScreenCoordinator.Screen.detailView(item: item)) {
                    Text(item)
                }
            }
        }
        .navigationTitle("Programmatic List View")
    }
}

//#Preview {
//    ProgrammaticListView()
//}
