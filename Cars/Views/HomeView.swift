//
//  HomeView.swift
//  Cars
//
//  Created by Vic Hagens on 18/12/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataManager.self) private var dataManager
    @Environment(PathStore.self) private var pathStore
    @State var selectedCar: Car? = nil
    @State var loading = true
    
    private let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        @Bindable var pathStore = pathStore
        NavigationStack(path: $pathStore.path) {
            if loading {
                ProgressView("Loading...")
            } else {
                TabView {
                    Tab("Cars", systemImage: "tray.and.arrow.down.fill"){
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(dataManager.getCars(), id: \.self) { car in
                                NavigationLink(value: car){
                                    Text("\(car.brand)")
                                }
                            }
                            
                        }.navigationDestination(for: Car.self) { car in
                            CarDetailView(car: car)
                        }
                    }
                    Tab(selectedCar?.brand ?? "no Car selected", systemImage: "tray.and.arrow.down.fill"){
                        CarDetailView(car: selectedCar)
                    }
                }
                        
                    
                
                
                
                
                
            }
        }.task {
            await dataManager.loadCars()
            loading = false
        }
    }
}
