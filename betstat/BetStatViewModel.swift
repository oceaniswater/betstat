//
//  BetStatViewModel.swift
//  betstat
//
//  Created by Mark Golubev on 14/02/2024.
//

import Foundation

struct BetCompanyModel {
    var imageURL: String
    var name: String
    var wins: UInt
    var loses: UInt
    var returns: UInt
    var averageWinCoefficient: Float
    var averageLoseCoefficient: Float
    var averageReturnCoefficient: Float
}

struct K {
    static let shared = K()
    private init() {}
    
    let company = BetCompanyModel(imageURL: "https://www.google.co.uk/url?sa=i&url=https%3A%2F%2F365oddsapi.com%2Fbookmakers-api%2F1xbet-api%2F&psig=AOvVaw1eIpNjZWqg9bF9W76nN1s0&ust=1708019574336000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCNiH4PGyq4QDFQAAAAAdAAAAABAI", name: "1xBet", wins: 10, loses: 5, returns: 2, averageWinCoefficient: 0.94, averageLoseCoefficient: 1.17, averageReturnCoefficient: 2.26)
}

class BetStatViewModel: ObservableObject {
    @Published var company = K.shared.company
    
    
    func getMax() -> Float {
        let max = max(company.averageWinCoefficient, company.averageLoseCoefficient, company.averageReturnCoefficient) + 1
        return max
    }
}
