//
//  Screen2ViewModel.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/27/23.
//

import Foundation

class Screen2ViewModel: ObservableObject {
    let screenCoordinator: ScreenCoordinator

    var title: String {
        "Screen 2"
    }
    
    var mainText: String {
        "This is Screen 2"
    }
    
    init(screenCoordinator: ScreenCoordinator) {
        self.screenCoordinator = screenCoordinator
    }
    
    func navigate(to screen: any DestinationView) {
        screenCoordinator.navigate(to: screen)
    }
    
    func backToRootView() {
        
        screenCoordinator.backToRootView()
    }
}
