//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import SwiftUI

struct MainView: View {
    @StateObject var converterVM: ConveterVM = ConveterVM()
    
    var body: some View {
        TabView {
            Tab("Received", systemImage: "house") {
                ConveterView(converterVM: converterVM)
            }

            Tab("Sent", systemImage: "gearshape") {
                SettingsView(converterVM: converterVM)
            }
        }
    }
}

#Preview {
    MainView()
}
