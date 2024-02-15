//
//  AverageCoefficientView.swift
//  betstat
//
//  Created by Mark Golubev on 15/02/2024.
//

import SwiftUI

struct AverageCoefficientView: View {
    
    var company: BetCompanyModel
    @EnvironmentObject var vm: BetStatViewModel
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Средние коэффициенты")
                .font(Font.subheadline.weight(.bold))
            
            GeometryReader { geometry in
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        ProgressBar(avgCoefficient: company.averageWinCoefficient,
                                    maxCoefficient: company.maxCoef,
                                    progressColor: .green,
                                    width: geometry.size.width)
                        ProgressBar(avgCoefficient: company.averageLoseCoefficient,
                                    maxCoefficient: company.maxCoef,
                                    progressColor: .red,
                                    width: geometry.size.width)
                        ProgressBar(avgCoefficient: company.averageReturnCoefficient,
                                    maxCoefficient: company.maxCoef,
                                    progressColor: Color(uiColor: .lightGray),
                                    width: geometry.size.width)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Выигрыш")
                        Text("Проигрыш")
                        Text("Возврат")
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(String(format: "%.2f", company.averageWinCoefficient))
                        Text(String(format: "%.2f", company.averageLoseCoefficient))
                        Text(String(format: "%.2f", company.averageReturnCoefficient))
                    }
                    .font(Font.footnote.weight(.bold))
                }
            }
        }
        .padding()
    }
}

#Preview(body: {
    AverageCoefficientView(company: K.shared.companies.first!)
        .environmentObject(BetStatViewModel())
})
