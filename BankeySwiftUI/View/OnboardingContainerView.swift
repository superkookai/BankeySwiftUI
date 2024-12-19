//
//  OnboardingContainerView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 19/12/2567 BE.
//

import SwiftUI

struct OnboardingContainerView: View {
    @ObservedObject var authService = AuthenService.shared
    
    var body: some View {
        TabView {
            OnboardingView(imageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
            
            OnboardingView(imageName: "world", titleText: "Move your money around the world quickly and securely.")
            
            OnboardingView(imageName: "thumbs", titleText: "Learn more at www.bankey.com.")
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .overlay(alignment: .topLeading) {
            Button("Close") {
                authService.hasOndoarded = true
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingContainerView()
}
