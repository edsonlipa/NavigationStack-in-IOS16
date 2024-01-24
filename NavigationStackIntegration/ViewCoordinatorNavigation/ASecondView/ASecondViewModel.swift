//
//  ASecondViewModel.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/29/23.
//

import Foundation
import Combine

class ASecondViewModel: ObservableObject {
    let backToRootView = PassthroughSubject<Void, Never>()
    
    init() { }
    
    func doSomethingAndBackToRoot() {
        // Do something
        backToRootView.send()
    }
}
