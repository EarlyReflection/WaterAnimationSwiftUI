//
//  BubbleView.swift
//  WaterAnimationSwiftUI
//
//  Created by Vladimir Dvornikov on 09/03/2023.
//

import SwiftUI

struct BubbleView: View {
    
    private let screen = UIScreen.main.bounds
    
    var opacity = 0.5
    var scale = 0.03
    var shiftX = 0.0
    var shiftY = 0.0
    
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
            BubbleView()
        }
        .ignoresSafeArea()
            
    }
}

