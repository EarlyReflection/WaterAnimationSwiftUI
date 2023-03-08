//
//  WaveView.swift
//  WaterAnimationSwiftUI
//
//  Created by Vladimir Dvornikov on 07/03/2023.
//

import SwiftUI

struct WaveView: View {
    
    private let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            Wave()
            Wave()
                .offset(x: -screen.width)
        }
    }
}


struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
        
    }
}

struct Wave: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                      control1: CGPoint(x: rect.midX, y: rect.midY * 0.90),
                      control2: CGPoint(x: rect.midX, y: rect.midY * 1.12))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        return path
    }
    
}
