//
//  BetCompanyModel.swift
//  betstat
//
//  Created by Mark Golubev on 15/02/2024.
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
