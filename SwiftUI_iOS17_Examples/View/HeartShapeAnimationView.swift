//
//  HeartShapeAnimationView.swift
//  SwiftUI_iOS17_Examples
//
//  Created by cano on 2023/07/19.
//

import SwiftUI

struct HeartShape: View {
    var body: some View {
        Image(systemName: "heart")
            .imageScale(.large)
            .foregroundColor(.primary)
    }
}

struct HeartShapeAnimationView: View {
    
    @State var sizeOf:Double = 1
    
    var body: some View {
        VStack {
            HeartShape()
                .phaseAnimator([true,false]) { content, phase in
                    content
                        .opacity(phase ? 1.0: 0.5)
                        .scaleEffect(phase ? 4.0: 1.0)
                }
        }
        .padding()
    }
}

#Preview {
    HeartShapeAnimationView()
}
