//
//  AFirstViewModel.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 11/28/23.
//

import Foundation
import SwiftUI

class AFirstViewModel: ObservableObject {
    @Published var presentedItem: AFirstViewCoordinator.Destination?
}
