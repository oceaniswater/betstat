//
//  ProgressBar.swift
//  betstat
//
//  Created by Mark Golubev on 15/02/2024.
//

import SwiftUI

struct ProgressBar: View {
    let avgCoefficient: Float
    let maxCoefficient: Float
    let progressColor: Color
    let width: Double
    
    private let barOpacity: Double = 0.3
    private let barHeight: CGFloat = 10
    private let progressBarOpacity: Double = 0.8
    private let widthBarPadding: Float = 115
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: width - CGFloat(widthBarPadding), height: barHeight)
                .opacity(barOpacity)
                .foregroundColor(.gray)
            
            Rectangle()
                .frame(width: CGFloat(avgCoefficient / maxCoefficient) * (width - CGFloat(widthBarPadding)), height: barHeight)
                .foregroundColor(progressColor)
                .opacity(progressBarOpacity)
        }
    }
}
