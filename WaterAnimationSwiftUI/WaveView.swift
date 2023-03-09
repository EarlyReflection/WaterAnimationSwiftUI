//
//  WaveView.swift
//  WaterAnimationSwiftUI
//
//  Created by Vladimir Dvornikov on 07/03/2023.
//

import SwiftUI

struct WaveView: View {
    
    private let screen = UIScreen.main.bounds
    private let color = LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            Wave()
                .fill(color)
            Wave()
                .offset(x: -screen.width)
                .fill(color)
        }
        .offset(y: screen.midY * 1.27)
    }
}


struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
            .ignoresSafeArea()
        
    }
}

struct Wave: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY - 100))
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.midY - 100),
                      control1: CGPoint(x: rect.midX, y: (rect.midY * 0.90) - 100),
                      control2: CGPoint(x: rect.midX, y: (rect.midY * 1.12) - 100))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        return path
    }
    
}
