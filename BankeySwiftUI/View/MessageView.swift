//
//  MessageView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 20/12/2567 BE.
//

import SwiftUI

struct MessageView: View {
    let notificationService: NotificationService
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(notificationService.message?.title ?? "Notification")
                    .font(.title3)
                    .bold()
                
                Text(notificationService.message?.body ?? "This is the body")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(notificationService.message?.kind == .notification ? Color.white : Color.red.opacity(0.5))
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 5)
            .padding(.horizontal)
            
            Spacer()
        }
        .transition(.move(edge: .top))
    }
}

#Preview {
    MessageView(notificationService: NotificationService.shared)
}
