//
//  BetStatViewModel.swift
//  betstat
//
//  Created by Mark Golubev on 14/02/2024.
//

import Foundation

class BetStatViewModel: ObservableObject {
    @Published var companies = K.shared.companies
    
    func getPercentWins(_ company: BetCompanyModel) -> UInt {
        return UInt(round(Float(company.wins) / Float(company.sumBets) * 100))
    }
    
    func getPercentLoses(_ company: BetCompanyModel) -> UInt {
        return UInt(round(Float(company.loses) / Float(company.sumBets) * 100))
    }
    
    func getPercentReturns(_ company: BetCompanyModel) -> UInt {
        return UInt(round(Float(company.returns) / Float(company.sumBets) * 100))
    }
    
    func formatBetsCount(_ count: UInt) -> String {
        let cases = [2, 0, 1, 1, 1, 2]
        let wordForms = ["ставка", "ставки", "ставок"]
        
        let index = (count % 100 > 4 && count % 100 < 20) ? 2 : cases[min(Int(count) % 10, 5)]
        
        return "\(count) \(wordForms[index])"
    }
}
