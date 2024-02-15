//
//  HeaderView.swift
//  betstat
//
//  Created by Mark Golubev on 15/02/2024.
//

import SwiftUI

struct HeaderView: View {
    let urlString: String
    let betsCount: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(maxHeight: 30)
            Text(betsCount)
                .font(Font.subheadline.weight(.medium))
        }
    }
}
