//
//  ARootViewModel.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/28/23.
//

import Foundation
import SwiftUI

class ARootViewModel: ObservableObject {
    @Published var navigationPath = NavigationPath() {
        didSet {
            print("ARootViewModel navigationPath \(navigationPath)")
        }
    }
    
    
}
