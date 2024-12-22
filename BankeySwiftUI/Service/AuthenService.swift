//
//  AuthenService.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 19/12/2567 BE.
//

import SwiftUI

enum LoginError: Error {
    case invalidUsernameOrPassword
    case usernameOrPassowedIsEmpty
}

@Observable
class AuthenService {
    static let shared = AuthenService()
    private init() {
        registerForNotifications()
    }
    
    var isAuthen: Bool = false
    
//    @ObservationIgnored
//    @AppStorage("hasOnboarded") var hasOndoarded: Bool = false
    
    var hasOnboarded: Bool = UserDefaults.standard.bool(forKey: "hasOnboarded")
//        get{
//            
//        }
//        set{
//            UserDefaults.standard.set(newValue, forKey: "hasOnboarded")
//        }

    
    var loginError: LoginError?
    var errorMessage: String {
        switch loginError {
        case .invalidUsernameOrPassword: "Incorrect username / password!"
        case .usernameOrPassowedIsEmpty: "Username / Password cannot be empty!"
        case .none: ""
        }
    }
    
    func login(username: String, password: String) {
        //Real life -> call Authentication Service
        if username.isEmpty || password.isEmpty{
            loginError = .usernameOrPassowedIsEmpty
            isAuthen = false
        } else if username.lowercased() == "kai" && password.lowercased() == "welcome" {
            loginError = nil
            isAuthen = true
        } else {
            loginError = .invalidUsernameOrPassword
            isAuthen = false
        }
    }
    
    private func registerForNotifications() {
        let name = Notification.Name("logout")
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: name, object: nil)
    }
    
    @objc func didLogout() {
        isAuthen = false
        NotificationCenter.default.removeObserver(self, name: Notification.Name("logout"), object: nil)
    }
}

//class AuthenService: ObservableObject {
//    static let shared = AuthenService()
//    private init() { }
//    
//    @Published var isAuthen: Bool = false
//    @AppStorage("hasOnboarded") var hasOndoarded: Bool = false
//    
//    var loginError: LoginError?
//    var errorMessage: String {
//        switch loginError {
//        case .invalidUsernameOrPassword: "Incorrect username / password!"
//        case .usernameOrPassowedIsEmpty: "Username / Password cannot be empty!"
//        case .none: ""
//        }
//    }
//    
//    func login(username: String, password: String) {
//        //Real life -> call Authentication Service
//        if username.isEmpty || password.isEmpty{
//            loginError = .usernameOrPassowedIsEmpty
//            isAuthen = false
//        } else if username.lowercased() == "kai" && password.lowercased() == "welcome" {
//            loginError = nil
//            isAuthen = true
//        } else {
//            loginError = .invalidUsernameOrPassword
//            isAuthen = false
//        }
//    }
//}
