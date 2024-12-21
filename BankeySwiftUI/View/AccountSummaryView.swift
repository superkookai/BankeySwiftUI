//
//  AccountSummaryView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import SwiftUI

struct AccountSummaryView: View {
    let accounts: [Account] = DataService.shared.accounts
    
    var body: some View {
        VStack {
            AccoutSummaryHeaderView()
            
            List(accounts) { account in
                AccountSummaryRowView(account: account)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    AccountSummaryView()
}
