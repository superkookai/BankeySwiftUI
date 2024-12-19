//
//  LoginView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 18/12/2567 BE.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isError: Bool = false
    @State private var errorMessage: String = ""
    @State private var isLoading: Bool = false
    
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
                    signInTapped()
                } label: {
                    HStack {
                        if isLoading{
                            ProgressView()
                                .foregroundStyle(.white)
                            Text("Loading")
                        } else {
                            Text("Sign In")
                        }
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                if isError {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                }
            }
            .offset(y: 90)
            
        }
        .padding()
    }
    
    func signInTapped(){
        if username.isEmpty || password.isEmpty{
            isError = true
            errorMessage = "Username / Password cannot be empty!"
            return
        }
        
        if username.lowercased() == "kai" && password.lowercased() == "password"{
            isLoading = true
        } else {
            isError = true
            errorMessage = "Incorrect username / password!"
        }
    }
}

#Preview {
    LoginView()
}
