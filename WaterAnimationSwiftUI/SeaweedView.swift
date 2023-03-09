//
//  Seaweed.swift
//  WaterAnimationSwiftUI
//
//  Created by Vladimir Dvornikov on 09/03/2023.
//

import SwiftUI

struct SeaweedView: View {
    var body: some View {
        Seaweed()
            .stroke(lineWidth: 3)
            
    }
}

struct SeaweedView_Previews: PreviewProvider {
    static var previews: some View {
        SeaweedView()
    }
}

struct Seaweed: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                      control1: CGPoint(x: rect.midX * 0.7, y: rect.midY * 1.5 ),
                      control2: CGPoint(x: rect.midX * 1.25, y: rect.midY * 1.5))
        return path
    }
    
    
    
}
