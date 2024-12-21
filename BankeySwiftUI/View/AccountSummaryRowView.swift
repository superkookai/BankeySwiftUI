//
//  AccountSummaryRowView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import SwiftUI

struct AccountSummaryRowView: View {
    let account: Account
    var underlineColor: Color {
        switch account.accountType {
        case .Banking: Color.teal
        case .CreditCard: Color.orange
        case .Investment: Color.purple
        }
    }
    var balanceName: String {
        switch account.accountType {
        case .Banking: "Current Balance"
        case .CreditCard: "Current Credit"
        case .Investment: "Value"
        }
    }
    var balanceNumberAttributedString: AttributedString {
        CurrencyFormatter().makeAttributedCurrency(account.balance)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(account.accountType.rawValue)
                    .font(.caption)
                Rectangle().frame(width: 60, height: 4)
                    .foregroundStyle(underlineColor)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text(account.accountName)
                    .font(.body)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(balanceName)
                        .font(.body)
                    Text("\(balanceNumberAttributedString)")
                        .font(.title)
                }
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.teal)
            }
        }
    }
}

#Preview {
    AccountSummaryRowView(account: DataService.shared.accounts[0])
}
