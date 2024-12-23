//
//  AccoutSummaryHeaderView.swift
//  BankeySwiftUI
//
//  Created by Weerawut Chaiyasomboon on 21/12/2567 BE.
//

import SwiftUI

struct AccoutSummaryHeaderView: View {
    @State private var shakeAngle: Double = 0
    @State private var isShaking: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Bankey")
                    .font(.title)
                
                Text("Good Morning,")
                Text("Kevin")
                Text(Date.now.formatted(date: .long, time: .omitted))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "sun.max.fill")
                .resizable()
                .foregroundStyle(Color.yellow)
                .frame(width: 100, height: 100)
                .padding(.bottom,16)
        }
        .padding()
        .background(.teal)
        .overlay(alignment: .bottomTrailing) {
            Button {
                triggerShake()
            } label: {
                Image(systemName: "bell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.white)
                    .padding(.trailing,10)
                    .padding(.bottom,10)
            }
            .rotationEffect(.radians(shakeAngle), anchor: .top)
            .animation(
                .easeInOut(duration: 0.1), // Smooth transitions
                value: shakeAngle
            )
        }
    }
    
    private func triggerShake() {
        if isShaking { return } // Prevent multiple triggers
        
        isShaking = true
        let shakeSequence: [Double] = [-.pi / 6, 0, .pi / 6, 0,
                                        -.pi / 6, 0, .pi / 6, 0,
                                        -.pi / 6, 0, .pi / 6, 0,
                                        -.pi / 6, 0, .pi / 6, 0 ]
        var currentStep = 0
        
        // Create a timer to handle the shake sequence
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            shakeAngle = shakeSequence[currentStep]
            currentStep += 1
            
            if currentStep >= shakeSequence.count { // End of the cycle
                timer.invalidate()
                isShaking = false
                shakeAngle = 0
            }
        }
    }
}

#Preview {
    AccoutSummaryHeaderView()
}
