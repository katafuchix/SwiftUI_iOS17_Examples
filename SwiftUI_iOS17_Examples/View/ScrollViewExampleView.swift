//
//  ScrollViewExampleView.swift
//  SwiftUI_iOS17_Examples
//
//  Created by cano on 2023/07/19.
//

import SwiftUI

struct ScrollViewExampleView: View {
    var body: some View {
        ScrollView (.horizontal){
            let colors:[Color] = [.red,.blue,.green,.yellow]
            
            LazyHStack(spacing:25){
                ForEach(colors,id:\.self){color in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(color.gradient)
                        .frame(height: 200)
                        .padding(.horizontal)
                        .containerRelativeFrame(.horizontal)
                }
                
            }
            .scrollTargetLayout()
            
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ScrollViewExampleView()
}
