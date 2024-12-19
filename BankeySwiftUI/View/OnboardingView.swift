//
//  OnboardingView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 19/12/2567 BE.
//

import SwiftUI

struct OnboardingView: View {
    let imageName: String
    let titleText: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
            
            Text(titleText)
                .font(.title3)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    OnboardingView(imageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
}

