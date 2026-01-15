//
//  AppState.swift
//  Cars
//
//  Created by Vic Hagens on 15/01/2026.
//

import Foundation
@Observable
class AppState {
    var selection: String = "Alle"
    var sorting = ["Alle","Benzine","Elektrisch"]
    var favorites: [Int] = []
}
