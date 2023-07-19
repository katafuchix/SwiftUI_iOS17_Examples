//
//  AnimationWithKeyFrameView.swift
//  SwiftUI_iOS17_Examples
//
//  Created by cano on 2023/07/19.
//

import SwiftUI

struct AnimationValues {
    var scale = 4.0
    var opacity = 1.0
    var angle = Angle.zero
    var color = Color.red
}

struct AnimationWithKeyFrameView: View {
    @State var doChange:Bool = false
    
    func returnColor(color:Double) -> Color {
            return Color.init(hue: color/360, saturation: 1.0, brightness: 1.0, opacity: 1.0)
     }
    
    var body: some View {
        VStack {
            HeartShape()
                .keyframeAnimator(initialValue: AnimationValues(), trigger: doChange) { content, value in
                    content
                        .foregroundStyle(value.color)
                        .opacity(value.opacity)
                        .scaleEffect(value.scale)
                        .rotationEffect(value.angle)
                } keyframes: { _ in
                    KeyframeTrack(\.scale) {
                        LinearKeyframe(2.0, duration: 2.5)
                        LinearKeyframe(2.0, duration: 1.5)
                        LinearKeyframe(3.5, duration: 2.5)
                    }
                    KeyframeTrack(\.angle) {
                        LinearKeyframe(Angle.degrees(0), duration: 2.5)
                        LinearKeyframe(Angle.degrees(90), duration: 0.5)
                        LinearKeyframe(Angle.degrees(-90), duration: 0.5)
                        LinearKeyframe(Angle.degrees(0), duration: 0.5)
                    }
                }.onTapGesture {
                    doChange.toggle()
                }
        }
    }
}

#Preview {
    AnimationWithKeyFrameView()
}
