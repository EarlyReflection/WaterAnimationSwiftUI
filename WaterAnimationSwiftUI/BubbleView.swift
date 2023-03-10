//
//  BubbleView.swift
//  WaterAnimationSwiftUI
//
//  Created by Vladimir Dvornikov on 09/03/2023.
//

import SwiftUI

struct BubbleView: View {
    
    private let screen = UIScreen.main.bounds
    
    let opacity: Double
    let scale: Double
    let shiftX: Double
    let shiftY: Double
    
    var body: some View {
        let buble = Circle()
        
        buble
            .fill(.white)
            .opacity(opacity)
            .scaleEffect(scale)
            .offset(y: screen.midY)
            .offset(x: shiftX, y: shiftY)
    }
}


struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray)
            BubbleView(opacity: 0.5, scale: 0.03, shiftX: 0, shiftY: 0)
        }
        .ignoresSafeArea()
            
    }
}

