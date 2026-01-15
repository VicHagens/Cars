//
//  CarDetailView.swift
//  Cars
//
//  Created by Vic Hagens on 18/12/2025.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car?
    var body: some View {
        if let car = car {
            VStack(alignment: .center) {
                Text(car.brand).font(.largeTitle)
                Text(car.model).font(.title)
                Text("$\(car.year)").font(.subheadline)
                Text("\(Int(car.price))")
                Text(car.color)
                Text(car.fuelType)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .navigationTitle("Detail")
        }
    }
}
