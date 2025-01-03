//
//  NotificationService.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 20/12/2567 BE.
//

import Foundation

struct Message {
    let title: String
    let body: String
    let kind: Kind
    
    enum Kind {
        case notification
        case error
    }
}

@Observable
class NotificationService {
    static let shared = NotificationService()
    private init() {
        listenMessageNotification()
    }
    
    var message: Message?
    var showMessage: Bool = false
    
    func showMessage(title: String, body: String, kind: Message.Kind = .notification) {
        showMessage = true
        message = Message(title: title, body: body, kind: kind)
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            self.showMessage = false
        }
    }
    
    private func listenMessageNotification() {
        let center = NotificationCenter.default
        let mainQueue = OperationQueue.main
        center.addObserver(forName: Notification.Name("Message"), object: nil, queue: mainQueue) { notification in
            let userInfo : [String : String] = notification.userInfo as! [String : String]
            self.showMessage(title: userInfo["title"]!, body: userInfo["body"]!)
        }
        center.removeObserver(self, name: Notification.Name("Message"), object: nil)
    }
}
