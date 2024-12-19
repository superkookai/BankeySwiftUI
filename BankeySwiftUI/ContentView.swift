//
//  ContentView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 18/12/2567 BE.
//

import SwiftUI

struct ContentView: View {
//    @ObservedObject var authService = AuthenService.shared
    
    @State var authService = AuthenService.shared
    
    var body: some View {
        ZStack{
            if !authService.isAuthen {
                LoginView()
            } else if !authService.hasOnboarded {
                OnboardingContainerView()
            } else {
                MainView()
            }
        }
    }
}

#Preview {
    ContentView()
}
