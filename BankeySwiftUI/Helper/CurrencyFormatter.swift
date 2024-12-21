//
//  CurrencyFormatter.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import SwiftUI

struct CurrencyFormatter {
    
    func makeAttributedCurrency(_ amount: Double) -> AttributedString {
        let tuple = breakIntoDollarsAndCents(amount)
        
        return makeBalanceAttributed(dollars: tuple.0, cents: tuple.1)
    }
    
    // Converts 929466.23 > "929,466" "23"
    func breakIntoDollarsAndCents(_ amount: Double) -> (String, String) {
        let tuple = modf(amount)
        
        let dollars = convertDollar(tuple.0)
        let cents = convertCents(tuple.1)
        
        return (dollars, cents)
    }
    
    // Converts 929466 > 929,466
    private func convertDollar(_ dollarPart: Double) -> String {
        let dollarsWithDecimal = dollarsFormatted(dollarPart) // "$929,466.00"
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        let decimalSeparator = formatter.decimalSeparator! // "."
        let dollarComponents = dollarsWithDecimal.components(separatedBy: decimalSeparator) // "$929,466" "00"
        var dollars = dollarComponents.first! // "$929,466"
        dollars.removeFirst() // "929,466"

        return dollars
    }
    
    // Convert 0.23 > 23
    private func convertCents(_ centPart: Double) -> String {
        let cents: String
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%.0f", centPart * 100)
        }
        return cents
    }
    
    // Converts 929466 > $929,466.00
    func dollarsFormatted(_ dollars: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: dollars as NSNumber) {
            return result
        }
        
        return ""
    }
    
    private func makeBalanceAttributed(dollars: String, cents: String) -> AttributedString {
        var attributedString = AttributedString()
        
        // Dollar sign attributes
        var dollarSignAttributes = AttributeContainer()
        dollarSignAttributes.font = .callout
        dollarSignAttributes.baselineOffset = 8
        attributedString += AttributedString("$", attributes: dollarSignAttributes)
        
        // Dollars attributes
        var dollarAttributes = AttributeContainer()
        dollarAttributes.font = .title
        attributedString += AttributedString(dollars, attributes: dollarAttributes)
        
        // Cents attributes
        var centAttributes = AttributeContainer()
        centAttributes.font = .callout
        centAttributes.baselineOffset = 8
        attributedString += AttributedString(cents, attributes: centAttributes)
        
        return attributedString
    }
}
