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
