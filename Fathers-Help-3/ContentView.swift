//
//  ContentView.swift
//  Fathers-Help-3
//
//  Created by Andrei Gorbunov on 05.03.2024.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image(systemName: "play.fill")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
    }
}

struct ContentView: View {
    @State private var performAnimation: Bool = false
    
    var body: some View {
        Button {
            if !performAnimation {
                withAnimation(.spring) {
                    performAnimation = true
                } completion: {
                    performAnimation = false
                }
            }
        } label: {
            GeometryReader { proxy in
                let width = proxy.size.width / 2
                
                HStack(alignment: .center, spacing: 0) {
                    ImageView()
                        .frame(width: performAnimation ? width : .zero)
                        .opacity(performAnimation ? 1 : .zero)
                    
                    ImageView()
                        .frame(width: width)
                    
                    ImageView()
                        .frame(width: performAnimation ? 0.5 : width)
                        .opacity(performAnimation ? .zero : 1)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(maxWidth: 62)
    }
}

#Preview {
    ContentView()
}
