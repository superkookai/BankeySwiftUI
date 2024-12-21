//
//  DataService.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import Foundation

@Observable
class DataService {
    var accounts: [Account] = []
    
    static let shared = DataService()
    private init() {
        fetchData()
    }
    
    private func fetchData() {
        let savings = Account(accountType: .Banking,
                              accountName: "Basic Savings",
                              balance: 929466.23)
        let chequing = Account(accountType: .Banking,
                               accountName: "No-Fee All-In Chequing",
                               balance: 17562.44)
        let visa = Account(accountType: .CreditCard,
                           accountName: "Visa Avion Card",
                           balance: 412.83)
        let masterCard = Account(accountType: .CreditCard,
                                 accountName: "Student Mastercard",
                                 balance: 50.83)
        let investment1 = Account(accountType: .Investment,
                                  accountName: "Tax-Free Saver",
                                  balance: 2000.00)
        let investment2 = Account(accountType: .Investment,
                                  accountName: "Growth Fund",
                                  balance: 15000.00)
        
        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
    }
}
