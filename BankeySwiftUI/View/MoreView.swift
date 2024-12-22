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
            
            Button {
//                withAnimation {
//                    NotificationService.shared.showMessage(title: "Error", body: "This is an error", kind: .error)
//                }
                withAnimation{
                    let messageNotification = Notification(name: Notification.Name("Message"),userInfo: ["title" : "NotiTest", "body" : "This is a body"])
                    NotificationCenter.default.post(messageNotification)
                }
            } label: {
                Text("Error Message")
            }
            .buttonStyle(.bordered)
            .foregroundStyle(.red)
        }
    }
}

#Preview {
    MoreView()
}
