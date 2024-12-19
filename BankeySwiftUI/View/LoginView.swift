//
//  LoginView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 18/12/2567 BE.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authService = AuthenService.shared
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("Bankey")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Text("Your premium source for all things banking!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,50)
            }
            .offset(y: -150)
            
            VStack {
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.words)
                
                Divider()
                
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.none)
                
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(.rect(cornerRadius: 5))
            
            VStack {
                Button {
                    authService.login(username: username, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Text(authService.errorMessage)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
            }
            .offset(y: 90)
            
        }
        .padding()
    }
    
}

#Preview {
    LoginView()
}
