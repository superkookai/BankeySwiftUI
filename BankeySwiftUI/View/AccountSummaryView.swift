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
        NavigationStack {
            AccoutSummaryHeaderView()
            
            List(accounts) { account in
                AccountSummaryRowView(account: account)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Logout") {
                        NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
                    }
                    .tint(.primary)
                }
            }
        }
    }
}

#Preview {
    AccountSummaryView()
}
