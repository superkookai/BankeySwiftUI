//
//  MoreView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        VStack {
            Text("MoreView")
        
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
    MoreView()
}
