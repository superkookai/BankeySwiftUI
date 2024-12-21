//
//  MainView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 19/12/2567 BE.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AccountSummaryView()
                .tabItem {
                    Text("Summary")
                    Image(systemName: "list.dash.header.rectangle")
                }
                .tag(0)
            
            Text("Move Money")
                .tabItem {
                    Text("Move Money")
                    Image(systemName: "arrow.left.arrow.right")
                }
                .tag(1)
            
            MoreView()
                .tabItem {
                    Text("More")
                    Image(systemName: "ellipsis.circle")
                }
                .tag(2)
        }
        .tint(.teal)
    }
}

#Preview {
    MainView()
}


