//
//  CarsApp.swift
//  Cars
//
//  Created by Vic Hagens on 18/12/2025.
//

import SwiftUI

@main
struct CarsApp: App {
    @State var dataManager = DataManager()
    @State var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataManager).environment(pathStore)
        }
    }
}
