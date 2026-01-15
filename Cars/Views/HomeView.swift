//
//  HomeView.swift
//  Cars
//
//  Created by Vic Hagens on 18/12/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataManager.self) private var dataManager
    //@Environment(PathStore.self) private var pathStore
    @Environment(AppState.self) private var appState
    @State var selectedCar: Car? = nil
    @State var loading = true
    @State private var isFavorite = true;
    var body: some View {
        //@Bindable var pathStore = pathStore
        @Bindable var state = appState
        NavigationStack() {

            if loading {
                ProgressView("Loading...")
            } else {
                Picker("Selection", selection: $state.selection) {
                    ForEach(state.sorting, id: \.self) { sorting in
                        Text(sorting)
                    }
                }.pickerStyle(.segmented)
                VStack {
                    List(dataManager.getCarsBySorting(sorting: state.selection), id: \.self, selection: $selectedCar) { car in
                        NavigationLink(destination: CarDetailView(car: selectedCar)) {
                            VStack(alignment: .leading) {
                                Text(car.brand + " " + car.model)
                                Text(car.color)
                                Button("Make Favorite"){
                                    if appState.favorites.contains(car.id) {
                                        appState.favorites.removeAll(where: {$0 == car.id})
                                    } else {
                                        appState.favorites.append(car.id)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }.task {
            await dataManager.loadCars()
            loading = false
        }
    }
}
