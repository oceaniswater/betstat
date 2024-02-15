//
//  BarView.swift
//  betstat
//
//  Created by Mark Golubev on 15/02/2024.
//

import SwiftUI

struct BarView: View {
    let bets: UInt
    let sumBets: UInt
    let percent: UInt
    let width: CGFloat
    let color: Color
    let alignment: HorizontalAlignment
    
    private let barHeight: CGFloat = 10
    private let barOpacity: Double = 0.8
    
    private let widthBarPadding: Float = 20
    private let minPercentForTruncation = 14
    private let minScaleFactor: CGFloat = 0.8
    
    var body: some View {
        VStack(alignment: alignment) {
            Rectangle()
                .frame(width: calculateBarWidth(value: bets, total: sumBets, maxWidth: width), height: barHeight)
                .foregroundColor(color)
                .opacity(barOpacity)
            Text(formatText(value: bets, percent: percent))
                .font(Font.footnote.weight(.bold))
                .minimumScaleFactor(minScaleFactor)
                .fixedSize(horizontal: true, vertical: false)
        }
    }
    
    private func formatText(value: UInt, percent: UInt) -> String {
        return percent > minPercentForTruncation ? "\(value) (\(percent)%)": "\(value)"
    }
    
    private func calculateBarWidth(value: UInt, total: UInt, maxWidth: CGFloat) -> CGFloat {
        return CGFloat(Float(value) / Float(total)) * (maxWidth - CGFloat(widthBarPadding))
    }
}
