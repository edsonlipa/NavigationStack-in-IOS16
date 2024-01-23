//
//  RootView.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/26/23.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var screenCoordinator: ScreenCoordinator
    
    var body: some View {
        NavigationStack(path: $screenCoordinator.navigationPath) {
            VStack {
                NavigationLink(value: Screen.screen1(user: .init(username: "elipa", name: "Edson", password: "pass"))) {
                    Text("go to fist View with navigation link")
                }
                
                Button(action: {
                    screenCoordinator.navigate(to: Screen.screen1(user: .init(username: "boliv", name: "Ben", password: "pass")))
                }, label: { Text("go to fist View with navigation path") })
            }
            .navigationTitle("Root View")
            .navigationDestination(for: Screen.self) { screen in
                screenCoordinator.view(for: screen)
            }
        }
    }
}
