//
//  SettingsView.swift
//  Cars
//
//  Created by Vic Hagens on 18/12/2025.
//

import SwiftUI

struct SettingsView: View {
    var sorting = ["price","branch","year"]
    @State var selectedSorting = "price"
    var body: some View {
        VStack{
            Picker("Sortering", selection: $selectedSorting) {
                ForEach(sorting, id: \.self) { sorting in
                    Text(sorting)
                }
            }.pickerStyle(.radioGroup)
            Text("\(selectedSorting)")
        }
    }
}
