//
//  ConveterView.swift
//  CurrencyConverter
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import SwiftUI

struct ConveterView: View {
    @ObservedObject var converterVM: ConveterVM
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    TextField("Forign Currency Value",text: $converterVM.amountf1)
                        .textFieldStyle(.roundedBorder)
                        .disabled(converterVM.isLkrConvertin)
                    
                    Picker("From Currency", selection: $converterVM.currency) {
                        ForEach(Currency.allCases, id: \.self) { currency in
                            Text(currency.rawValue.uppercased())
                        }
                    }
                }
                
                HStack{
                    TextField("Local Currency Value",text: $converterVM.amountf2)
                        .textFieldStyle(.roundedBorder)
                        .disabled(!converterVM.isLkrConvertin)
                    
                    Text("LKR")
                }
                
                HStack{
                    Text("Switch Calculation")
                    
                    Toggle("", isOn: $converterVM.isLkrConvertin)
                }
                
                Spacer()
                
                Button {
                    converterVM.amountf1 = "0"
                    converterVM.amountf2 = "0"
                } label: {
                    Text("Reset Text Fields")
                        .foregroundStyle(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .background(Color.red.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .navigationTitle("Currency Converter")
            .padding()
            .onChange(of: converterVM.amountf1) {
                converterVM.convert()
            }
            .onChange(of: converterVM.amountf2) {
                converterVM.convert()
            }
            .onChange(of: converterVM.currency) {
                converterVM.convert()
            }
            .onChange(of: converterVM.isLkrConvertin) {
                converterVM.convert()
            }
        }
    }
}

#Preview {
    ConveterView(converterVM: ConveterVM())
}
