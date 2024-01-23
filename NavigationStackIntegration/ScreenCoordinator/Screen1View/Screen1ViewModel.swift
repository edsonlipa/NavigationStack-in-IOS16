//
//  Screen1ViewModel.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/26/23.
//

import Foundation
import SwiftUI

class Screen1ViewModel: ObservableObject {
    let screenCoordinator: ScreenCoordinator
    let user: User

    var title: String {
        "Screen 1"
    }
    
    var mainText: String {
        "This is Screen 1"
    }
    
    init(screenCoordinator: ScreenCoordinator, user: User) {
        self.screenCoordinator = screenCoordinator
        self.user = user
    }
    
    func navigate(to screen: Screen) {
        screenCoordinator.navigate(to: screen)
    }
    

    func backToRootView() {
        screenCoordinator.backToRootView()
    }
}
