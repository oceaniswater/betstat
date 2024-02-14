//
//  BetStatViewModel.swift
//  betstat
//
//  Created by Mark Golubev on 14/02/2024.
//

import Foundation

struct BetCompanyModel: Identifiable {
    let id: Int
    var imageURL: String
    var name: String
    var wins: UInt
    var loses: UInt
    var returns: UInt
    var averageWinCoefficient: Float
    var averageLoseCoefficient: Float
    var averageReturnCoefficient: Float
    
    var sumBets: UInt {
        return wins + loses + returns
    }
    
    var maxCoef: Float {
        return max(averageWinCoefficient, averageLoseCoefficient, averageReturnCoefficient) + 1
    }
}

struct K {
    static let shared = K()
    private init() {}
    
    let company = BetCompanyModel(id: 1, imageURL: "https://www.google.co.uk/url?sa=i&url=https%3A%2F%2F365oddsapi.com%2Fbookmakers-api%2F1xbet-api%2F&psig=AOvVaw1eIpNjZWqg9bF9W76nN1s0&ust=1708019574336000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCNiH4PGyq4QDFQAAAAAdAAAAABAI", name: "1xBet", wins: 10, loses: 5, returns: 2, averageWinCoefficient: 0.94, averageLoseCoefficient: 1.17, averageReturnCoefficient: 2.26)
    
    let companies: [BetCompanyModel] = [BetCompanyModel(id: 1, imageURL: "https://365oddsapi.com/wp-content/uploads/2023/05/1xbet-logo-0.png", name: "1xBet", wins: 111, loses: 500, returns: 2, averageWinCoefficient: 0.94, averageLoseCoefficient: 1.17, averageReturnCoefficient: 2.26), BetCompanyModel(id: 2, imageURL: "https://365oddsapi.com/wp-content/uploads/2023/05/1xbet-logo-0.png", name: "1xBet", wins: 10, loses: 5, returns: 2, averageWinCoefficient: 0.94, averageLoseCoefficient: 1.17, averageReturnCoefficient: 2.26), BetCompanyModel(id: 3, imageURL: "https://365oddsapi.com/wp-content/uploads/2023/05/1xbet-logo-0.png", name: "1xBet", wins: 10, loses: 5, returns: 2, averageWinCoefficient: 0.94, averageLoseCoefficient: 1.17, averageReturnCoefficient: 2.26)]
}

class BetStatViewModel: ObservableObject {
    @Published var company = K.shared.company
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
