//
//  MainView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 19/12/2567 BE.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("MainView")
            
            Button {
                withAnimation(.easeInOut) {
                    AuthenService.shared.isAuthen = false
                    NotificationService.shared.showMessage(title: "Sign Out", body: "You're signed out", kind: .notification)
                }
            } label: {
                Text("Sign Out")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MainView()
}
