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
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Выигрыши/проигрыши по букмекерам")
                .font(Font.subheadline.weight(.bold))
            
            HeaderView(urlString: company.imageURL, betsCount: vm.formatBetsCount(company.sumBets))
                .padding(.top, 15)
                .padding(.bottom, 10)
            
            GeometryReader { geometry in
                HStack {
                    BarView(bets: company.wins,
                            sumBets: company.sumBets,
                            percent: vm.getPercentWins(company),
                            width: geometry.size.width,
                            color: .green,
                            alignment: .leading)
                    BarView(bets: company.loses,
                            sumBets: company.sumBets,
                            percent: vm.getPercentLoses(company),
                            width: geometry.size.width,
                            color: .red,
                            alignment: .leading)
                    BarView(bets: company.returns,
                            sumBets: company.sumBets,
                            percent: vm.getPercentReturns(company),
                            width: geometry.size.width,
                            color: Color(uiColor: .lightGray),
                            alignment: .trailing)
                }
            }
        }
        .padding()
    }
}

#Preview(body: {
    WinLoseView(company: K.shared.companies.first!)
        .environmentObject(BetStatViewModel())
})
