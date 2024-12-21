//
//  Account.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import Foundation

struct Account: Identifiable {
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    let id = UUID()
    let accountType: AccountType
    let accountName: String
    let balance: Double
}
