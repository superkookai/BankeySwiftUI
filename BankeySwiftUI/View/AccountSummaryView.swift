//
//  AccountSummaryView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import SwiftUI

struct AccountSummaryView: View {
    let games = [
        "Pacman",
        "Space Invaders",
        "Space Patrol",
    ]
    
    var body: some View {
        VStack {
            AccoutSummaryHeaderView()
            
            List(games, id: \.self) { game in
                Text(game)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    AccountSummaryView()
}
