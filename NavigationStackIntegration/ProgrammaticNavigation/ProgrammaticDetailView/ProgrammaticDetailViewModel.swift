//
//  ProgrammaticDetailViewModel.swift
//  NavigationStackIntegration
//
//  Created by Edson Lipa on 1/23/24.
//

import Foundation

class ProgrammaticDetailViewModel: ObservableObject {
    var item: String
    let emojis = ["😀", "👍", "🚀", "🌟", "🍎", "🎉", "🏀", "📚", "🎨", "🌈", "🎸", "🚗", "🏖️", "🍕", "🐱", "🐶", "🌺", "🌍", "🕰️", "🌙"]

    init(item: String) {
        self.item = item
    }
}
