//
//  Constants.swift
//  betstat
//
//  Created by Mark Golubev on 15/02/2024.
//

struct K {
    static let shared = K()
    private init() {}
    
    let companies: [BetCompanyModel] = [BetCompanyModel(id: 1,
                                                        imageURL: "https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_1xBet.png",
                                                        name: "1xBet",
                                                        wins: 16,
                                                        loses: 11,
                                                        returns: 5,
                                                        averageWinCoefficient: 1.94,
                                                        averageLoseCoefficient: 2.17,
                                                        averageReturnCoefficient: 1.26),
                                        BetCompanyModel(id: 2,
                                                        imageURL: "https://www.newbettingoffers.co.uk/assets/uploads/Parimatchlogolargenew.PNG",
                                                        name: "parimatch",
                                                        wins: 10,
                                                        loses: 5,
                                                        returns: 5,
                                                        averageWinCoefficient: 0.94,
                                                        averageLoseCoefficient: 1.17,
                                                        averageReturnCoefficient: 2.26),
                                        BetCompanyModel(id: 3,
                                                        imageURL: "https://stavkinakibersport.com/wp-content/uploads/2021/03/leonlogo.jpg", name: "leon",
                                                        wins: 100,
                                                        loses: 15,
                                                        returns: 20,
                                                        averageWinCoefficient: 0.94,
                                                        averageLoseCoefficient: 1.17,
                                                        averageReturnCoefficient: 2.26),
                                        BetCompanyModel(id: 4,
                                                        imageURL: "https://marxmail.org/wp-content/uploads/2022/09/1579067909_21.jpg",
                                                        name: "marathon",
                                                        wins: 1000,
                                                        loses: 150,
                                                        returns: 20,
                                                        averageWinCoefficient: 0.94,
                                                        averageLoseCoefficient: 1.17,
                                                        averageReturnCoefficient: 2.26)]
}
