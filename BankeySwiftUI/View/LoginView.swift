//
//  LoginView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 18/12/2567 BE.
//

import SwiftUI

struct LoginView: View {
//    @ObservedObject var authService = AuthenService.shared
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isOnScreen: Bool = false
    @State private var shakeOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack {
                Text("Bankey")
                    .font(.largeTitle)
                    .padding(.bottom)
                    .scaleEffect(isOnScreen ? 1 : 3)
                    .animation(.easeInOut(duration: 2).repeatCount(2, autoreverses: true), value: isOnScreen)
                
                Text("Your premium source for all things banking!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,50)
                    .offset(x: isOnScreen ? 0 : -1000)
                    .animation(.easeInOut(duration: 2), value: isOnScreen)
            }
            .offset(y: -150)
            
            VStack {
//                TextField("Username", text: $username)
//                    .textInputAutocapitalization(.words)
                
                TextFieldWithClearButton(text: $username)
                
                Divider()
                
//                SecureField("Password", text: $password)
//                    .textInputAutocapitalization(.none)
                SecureFieldToggleView(password: $password)
                
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(.rect(cornerRadius: 5))
            
            VStack {
                Button {
                    AuthenService.shared.login(username: username, password: password)
//                    authService.login(username: username, password: password)
                    
                    if AuthenService.shared.loginError != nil {
                        triggerShake()
                    }
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .offset(x: shakeOffset)
                .animation(.default, value: shakeOffset)
                
                Text(AuthenService.shared.errorMessage)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .frame(height: 20)
            }
            .offset(y: 100)
        }
        .padding()
        .onAppear {
            isOnScreen = true
        }
    }
    
    private func triggerShake() {
        // The shake motion cycle
        shakeOffset = -10
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            shakeOffset = 10
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            shakeOffset = 0
        }
    }
    
}

#Preview {
    LoginView()
}

struct SecureFieldToggleView: View {
    @Binding var password: String
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        HStack {
            if isPasswordVisible {
                TextField("Password", text: $password)
                    .textInputAutocapitalization(.none)
            } else {
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.none)
            }
            
            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical,2)
    }
}

struct TextFieldWithClearButton: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Username", text: $text)
                .textInputAutocapitalization(.words)
                .padding(.trailing, 30) // Add padding to make space for the button
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 5) // Adjust button spacing
            }
        }
    }
}
