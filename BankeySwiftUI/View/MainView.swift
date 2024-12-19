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
                AuthenService.shared.isAuthen = false
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
