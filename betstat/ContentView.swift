//
//  ContentView.swift
//  betstat
//
//  Created by Mark Golubev on 14/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm: BetStatViewModel = BetStatViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(vm.companies) {company in
                AverageCoefficientView(company: company)
                    .padding()
                
                WinLoseView(company: company)
                    .padding()
            }
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}

struct AverageCoefficientView: View {
    
    var company: BetCompanyModel
    @EnvironmentObject var vm: BetStatViewModel
    
    let widhtBar: Float = 115
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Средние коэффициенты")
                .font(Font.subheadline.weight(.bold))
            
            GeometryReader { geometry in
                HStack {
                    VStack(spacing: 10) {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widhtBar), height: 10)
                                .opacity(0.3)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageWinCoefficient / company.maxCoef) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
                                .foregroundColor(.green)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        }
                        
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widhtBar), height: 10)
                                .opacity(0.3)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageLoseCoefficient / company.maxCoef) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
                                .foregroundColor(.red)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        }
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widhtBar), height: 10)
                                .opacity(0.3)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageReturnCoefficient / company.maxCoef) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
                                .foregroundColor(Color(uiColor: .lightGray))
                        }
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Выигрыш")
                        Text("Проигрыш")
                        Text("Выигрыш")
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(String(format: "%.2f", vm.company.averageWinCoefficient))
                        Text(String(format: "%.2f", vm.company.averageLoseCoefficient))
                        Text(String(format: "%.2f", vm.company.averageReturnCoefficient))
                    }
                    .font(Font.footnote.weight(.bold))
                    
                }
            }
            
        }
        .padding()
    }
}

struct WinLoseView: View {
    var company: BetCompanyModel
    @EnvironmentObject var vm: BetStatViewModel
    
    let widhtBar: Float = 20
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Выигрыши/проигрыши по букмекерам")
                .font(Font.subheadline.weight(.bold))
            
            HStack {
                AsyncImage(url: URL(string: company.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 70)
                Text("\(vm.formatBetsCount(company.sumBets))")
                    .font(Font.subheadline.weight(.medium))
            }
            .padding(.bottom, -10)
            
            GeometryReader { geometry in
                HStack {
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: CGFloat(Float(company.wins ) / Float(company.sumBets)) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
                            .foregroundColor(.green)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        Text(vm.getPercentWins(company) > 20 ? "\(company.wins) (\(vm.getPercentWins(company))%)" : "\(company.wins)")
                            .font(Font.footnote.weight(.bold))
                            .minimumScaleFactor(0.8)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: CGFloat(Float(company.loses ) / Float(company.sumBets)) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
                            .foregroundColor(.red)
                            .opacity(0.8)
                        Text(vm.getPercentLoses(company) > 20 ? "\(company.loses) (\(vm.getPercentLoses(company))%)" : "\(company.loses)")
                            .font(Font.footnote.weight(.bold))
                            .minimumScaleFactor(0.8)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                    VStack(alignment: .trailing) {
                        Rectangle()
                            .frame(width: CGFloat(Float(company.returns) / Float(company.sumBets)) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
                            .foregroundColor(.gray)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        Text(vm.getPercentReturns(company) > 20 ? "\(company.returns) (\(vm.getPercentReturns(company))%)" : "\(company.returns)")
                            .font(Font.footnote.weight(.bold))
                            .minimumScaleFactor(0.8)
                            .fixedSize(horizontal: true, vertical: false)

                    }
                }
            }
        }
        .padding()
    }
}
