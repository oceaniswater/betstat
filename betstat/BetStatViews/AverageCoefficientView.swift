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
    
    private let barHeight: CGFloat = 10
    private let progressBarOpacity: Double = 0.8
    private let barOpacity: Double = 0.3
    private let widthBarPadding: Float = 115
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Средние коэффициенты")
                .font(Font.subheadline.weight(.bold))
            
            GeometryReader { geometry in
                HStack {
                    VStack(spacing: 10) {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widthBarPadding), height: barHeight)
                                .opacity(barOpacity)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageWinCoefficient / company.maxCoef) * (geometry.size.width - CGFloat(widthBarPadding)), height: barHeight)
                                .foregroundColor(.green)
                                .opacity(progressBarOpacity)
                        }
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widthBarPadding), height: barHeight)
                                .opacity(barOpacity)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageLoseCoefficient / company.maxCoef) * (geometry.size.width - CGFloat(widthBarPadding)), height: barHeight)
                                .foregroundColor(.red)
                                .opacity(progressBarOpacity)
                        }
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widthBarPadding), height: barHeight)
                                .opacity(barOpacity)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageReturnCoefficient / company.maxCoef) * (geometry.size.width - CGFloat(widthBarPadding)), height: barHeight)
                                .foregroundColor(Color(uiColor: .lightGray))
                                .opacity(progressBarOpacity)
                            
                        }
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
