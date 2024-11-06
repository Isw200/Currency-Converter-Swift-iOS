//
//  ConveterVM.swift
//  CurrencyConverter
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import Foundation

enum Currency: String, CaseIterable {
    case usd, gbp, aud, cad, eur
}

class ConveterVM: ObservableObject {
    @Published var currency: Currency = .usd
    @Published var isLkrConvertin: Bool = false
    @Published var amountf1: String = "0"
    @Published var amountf2 : String = "0"
    @Published var currencies: [Currency] = Currency.allCases
    
    let rates: [Currency: Double] = [
        .usd: 308.81,
        .gbp: 390.31,
        .aud: 204.40,
        .cad: 232.82,
        .eur: 334.92
    ]
    
    func convert() {
        if isLkrConvertin {
            guard let rate = rates[currency] else { return }
            guard let amountf2 = Double(amountf2) else { return }
            let lkrRate = 1.0 / rate
            amountf1 = "\(amountf2 * lkrRate)"
        } else {
            guard let rate = rates[currency] else { return }
            guard let amountf1 = Double(amountf1) else { return }
            amountf2 = "\(amountf1 * rate)"
        }
    }
}
