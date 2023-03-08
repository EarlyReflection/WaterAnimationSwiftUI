//
//  ContentView.swift
//  WaterAnimationSwiftUI
//
//  Created by Vladimir Dvornikov on 07/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var waveAnimate = false
    @State private var waterAnimate = false
    private let screen = UIScreen.main.bounds
    
    
    var body: some View {
        ZStack {
            ZStack {
                WaveView()
                    .foregroundColor(Color.init(red: 0, green: 0.5, blue: 1, opacity: 0.4))
                    .offset(x: waveAnimate ? screen.width : 0)
                //ИСПРАВИТЬ ПОВЕДЕНИЕ АНИМАЦИИ!
                    .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: waveAnimate )
                WaveView()
                    .foregroundColor(Color.init(red: 0, green: 0.2, blue: 1, opacity: 0.4))
                    .offset(x: waveAnimate ? screen.width : 0)
                    .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: waveAnimate )
            }
            .offset(y: waterAnimate ? 0 : screen.midY)
            //ИСПРАВИТЬ ПОВЕДЕНИЕ АНИМАЦИИ!
            .animation(.default, value: waterAnimate )
            
            VStack {
                Spacer()
                Button("Start Animation") {
                    waveAnimate.toggle()
                    waterAnimate.toggle()
                }
                .tint(.red)
                .padding(.bottom, 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .ignoresSafeArea()
    }
}
