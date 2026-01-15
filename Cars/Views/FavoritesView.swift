//
//  FavoritesView.swift
//  Cars
//
//  Created by Vic Hagens on 18/12/2025.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(AppState.self) private var appState
    @Environment(DataManager.self) private var dataManager
    var body: some View {
        @Bindable var state = appState
        List(dataManager.getCarsById(state.favorites)) { car in
            NavigationLink(destination: CarDetailView(car: car)) {
                VStack(alignment: .leading) {
                    Text(car.brand + " " + car.model)
                    Text(car.color)
                }
            }
        }
    }
}
