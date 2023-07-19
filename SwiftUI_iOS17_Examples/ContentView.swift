//
//  ContentView.swift
//  SwiftUI_iOS17_Examples
//
//  Created by cano on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationStack {
            List {
                Section(header: Text("Animations")) {
                    
                    NavigationLink("Heart Shape Animation", destination: HeartShapeAnimationView())
                    
                    NavigationLink("Animation With External Event", destination: AnimationWithExternalEventView())
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
