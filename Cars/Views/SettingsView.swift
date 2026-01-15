//
//  SettingsView.swift
//  Cars
//
//  Created by Vic Hagens on 18/12/2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(DataManager.self) private var dataManager
    var body: some View {
        @Bindable var manager = dataManager
        VStack{
            Picker("Sorteer voorkeur", selection: $manager.SortPreference) {
                ForEach(SortPreference.allCases, id: \.self) { preference in
                    Text(preference.rawValue).tag(preference)
                }
            }.pickerStyle(.radioGroup)
        }
    }
}
