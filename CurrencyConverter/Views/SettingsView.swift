//
//  SettingsView.swift
//  CurrencyConverter
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var converterVM: ConveterVM
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Currency")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                
                Picker("Currency", selection: $converterVM.currency) {
                    ForEach(Currency.allCases, id: \.self) { currency in
                        Text(currency.rawValue.uppercased())
                    }
                }
                .pickerStyle(.wheel)
                
                Spacer()
                
                Button {
                    converterVM.currency = .usd
                } label: {
                    Text("Reset Settings")
                        .foregroundStyle(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .background(Color.red.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(converterVM: ConveterVM())
}
