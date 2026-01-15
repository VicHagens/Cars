//
//  ContentView.swift
//  Cars
//
//  Created by Vic Hagens on 18/12/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                Tab("Home", systemImage: "tray.and.arrow.down.fill"){
                    HomeView()
                }
                Tab("Favorieten", systemImage: "tray.and.arrow.down.fill"){
                    NavigationStack {
                        FavoritesView()
                    }
                }
                Tab("Instellingen", systemImage: "tray.and.arrow.down.fill"){
                    SettingsView()
                }
            }
        }
    }
}
