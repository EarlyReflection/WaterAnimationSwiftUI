//
//  ContentView.swift
//  WaterAnimationSwiftUI
//
//  Created by Vladimir Dvornikov on 07/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    private let screen = UIScreen.main.bounds
    
    @State private var offsetY = 0.0
    @State private var offsetFirstWave = 0.0
    @State private var offsetSecondWave = 0.0
    @State private var bubbleShiftX = 0.0
    @State private var bubbleShiftY = 0.0
    
    
    var body: some View {
        ZStack {
            ZStack {
                WaveView()
                    .offset(x: offsetFirstWave)
                    .opacity(0.6)
                WaveView()
                    .offset(x: offsetSecondWave)
                    .opacity(0.4)
            }
            .offset(y: offsetY)
            
            BubbleView(opacity: 0.6, scale: 0.02, shiftX: bubbleShiftX - 150, shiftY: bubbleShiftY)
            BubbleView(opacity: 0.5, scale: 0.03, shiftX: bubbleShiftX - 125, shiftY: bubbleShiftY + 200)
            BubbleView(opacity: 0.5, scale: 0.025, shiftX: bubbleShiftX, shiftY: bubbleShiftY + 150)
            BubbleView(opacity: 0.3, scale: 0.020, shiftX: bubbleShiftX, shiftY: bubbleShiftY + 300)
            BubbleView(opacity: 0.8, scale: 0.015, shiftX: bubbleShiftX + 100, shiftY: bubbleShiftY + 100)
            BubbleView(opacity: 0.4, scale: 0.025, shiftX: bubbleShiftX + 90, shiftY: bubbleShiftY + 150)
            
            VStack {
                Spacer()
                Button("Start Animation") { animate() }
                    .foregroundColor(.red)
                    .padding(.bottom, 50)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                offsetFirstWave = compare(offsetFirstWave, with: screen.width, changeBy: 1) { $0 <= $1 }
                offsetSecondWave = compare(offsetSecondWave, with: screen.width, changeBy: 1.5) { $0 <= $1 }
                bubbleShiftY = compare(bubbleShiftY, with: -screen.midY - 200, changeBy: -3) { $0 >= $1 }
                
                withAnimation(Animation.easeInOut(duration: 3).repeatForever())  {
                    bubbleShiftX = 20
                }
                print("number: \(bubbleShiftY) value:\(-screen.midY - 200)")
            }
        }
    }
    
    private func animate() {
        if offsetY == 0.0 {
            withAnimation(Animation.easeOut(duration: 7)) {
                offsetY -= screen.midY
            }
        }
    }
    
    func compare(_ number: Double, with value: Double, changeBy: Double, closure: (Double, Double) -> Bool) -> Double {
        var newNumber = number
        if closure(newNumber, value) {
            newNumber += changeBy
        } else {
            newNumber = 0
        }
        return newNumber
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .ignoresSafeArea()
    }
}
