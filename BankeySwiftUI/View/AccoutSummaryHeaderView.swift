//
//  AccoutSummaryHeaderView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import SwiftUI

struct AccoutSummaryHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Bankey")
                    .font(.title)
                
                Text("Good Morning,")
                Text("Kevin")
                Text(Date.now.formatted(date: .long, time: .omitted))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "sun.max.fill")
                .resizable()
                .foregroundStyle(Color.yellow)
                .frame(width: 100, height: 100)
        }
        .padding()
        .background(.teal)
    }
}

#Preview {
    AccoutSummaryHeaderView()
}
