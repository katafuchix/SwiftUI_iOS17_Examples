//
//  AnimationWithExternalEventView.swift
//  SwiftUI_iOS17_Examples
//
//  Created by cano on 2023/07/19.
//

import SwiftUI

enum Phase: CaseIterable {
    case initial
    case stateA
    case stateB
    case stateC
    
    var changeOpacity: Double {
        switch self {
            case .initial: 1
            case .stateA: 0.8
            case .stateB: 0.6
            case .stateC: 0.4
        }
    }
    
    var changeScale: Double {
        switch self {
            case .initial: 4
            case .stateA: 3
            case .stateB: 2
            case .stateC: 1
        }
    }
    
    var changeAngle: Double {
        switch self {
        case .initial: 0
        case .stateA: 90
        case .stateB: 180
        case .stateC: 270
        }
    }
    
    var changeColor: Color {
        switch self {
            case .initial: .red
            case .stateA: .yellow
            case .stateB: .green
            case .stateC: .blue
        }
    }
}

struct HeartShapeView: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .imageScale(.large)
    }
}

struct AnimationWithExternalEventView: View {

    @State var doChange:Bool = false
    
    var body: some View {
        VStack {
            HeartShapeView()
                .phaseAnimator(Phase.allCases, trigger: doChange) { content, phase in
                    content
                        .foregroundStyle(phase.changeColor)
                        .opacity(phase.changeOpacity)
                        .scaleEffect(phase.changeScale)
                        .rotationEffect(.degrees(phase.changeAngle))
                } animation: { phase in
                        .easeInOut(duration: 2.0)
                }
        }
        .padding()
        .onTapGesture {
            doChange.toggle()
        }
    }
}

#Preview {
    AnimationWithExternalEventView()
}
