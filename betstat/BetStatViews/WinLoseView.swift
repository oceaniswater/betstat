//
//  WinLoseView.swift
//  betstat
//
//  Created by Mark Golubev on 15/02/2024.
//
import SwiftUI


struct WinLoseView: View {
    var company: BetCompanyModel
    @EnvironmentObject var vm: BetStatViewModel
    
    private let barHeight: CGFloat = 10
    private let barOpacity: Double = 0.8
    
    private let widthBarPadding: Float = 20
    private let minPercentForTruncation = 14
    private let minScaleFactor: CGFloat = 0.8
    
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
                .frame(maxHeight: 30)
                Text("\(vm.formatBetsCount(company.sumBets))")
                    .font(Font.subheadline.weight(.medium))
            }
            .padding(.top, 15)
            .padding(.bottom, 10)
            
            GeometryReader { geometry in
                HStack {
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: calculateBarWidth(value: company.wins, total: company.sumBets, maxWidth: geometry.size.width), height: barHeight)
                            .foregroundColor(.green)
                            .opacity(barOpacity)
                        Text(formatText(type: .win, value: company.wins, percent: vm.getPercentWins(company)))
                            .font(Font.footnote.weight(.bold))
                            .minimumScaleFactor(minScaleFactor)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: calculateBarWidth(value: company.loses, total: company.sumBets, maxWidth: geometry.size.width), height: barHeight)
                            .foregroundColor(.red)
                            .opacity(barOpacity)
                        Text(formatText(type: .lose, value: company.loses, percent: vm.getPercentWins(company)))                            .font(Font.footnote.weight(.bold))
                            .minimumScaleFactor(minScaleFactor)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                    VStack(alignment: .trailing) {
                        Rectangle()
                            .frame(width: calculateBarWidth(value: company.returns, total: company.sumBets, maxWidth: geometry.size.width), height: barHeight)
                            .foregroundColor(.gray)
                            .opacity(barOpacity)
                        Text(formatText(type: .returns, value: company.returns, percent: vm.getPercentWins(company)))
                            .font(Font.footnote.weight(.bold))
                            .minimumScaleFactor(minScaleFactor)
                            .fixedSize(horizontal: true, vertical: false)
                        
                    }
                }
            }
        }
        .padding()
    }
    
    private func calculateBarWidth(value: UInt, total: UInt, maxWidth: CGFloat) -> CGFloat {
        return CGFloat(Float(value) / Float(total)) * (maxWidth - CGFloat(widthBarPadding))
    }
    
    private enum BetsResult {
        case win
        case lose
        case returns
    }

    private func formatText(type: BetsResult, value: UInt, percent: UInt) -> String {
        switch type {
        case .win:
            return vm.getPercentWins(company) > minPercentForTruncation ? "\(value) (\(percent)%)": "\(value)"
        case .lose:
            return vm.getPercentLoses(company) > minPercentForTruncation ? "\(value) (\(percent)%)": "\(value)"
        case .returns:
            return vm.getPercentReturns(company) > minPercentForTruncation ? "\(value) (\(percent)%)": "\(value)"
        }
        
    }
}
