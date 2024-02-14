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
        VStack {
            AverageCoefficientView(company: $vm.company)
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}

struct AverageCoefficientView: View {
    
    @Binding var company: BetCompanyModel
    @EnvironmentObject var vm: BetStatViewModel
    
    let widhtBar: Float = 115
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Средние коэффициенты")
                .font(Font.headline.weight(.bold))
            
            GeometryReader { geometry in
                HStack {
                    VStack(spacing: 10) {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widhtBar), height: 10)
                                .opacity(0.3)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageWinCoefficient / vm.getMax()) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
                                .foregroundColor(.green)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        }
                        
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widhtBar), height: 10)
                                .opacity(0.3)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageLoseCoefficient / vm.getMax()) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
                                .foregroundColor(.red)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        }
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width - CGFloat(widhtBar), height: 10)
                                .opacity(0.3)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(width: CGFloat(company.averageReturnCoefficient / vm.getMax()) * (geometry.size.width - CGFloat(widhtBar)), height: 10)
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
