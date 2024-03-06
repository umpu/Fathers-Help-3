//
//  ContentView.swift
//  Fathers-Help-3
//
//  Created by Andrei Gorbunov on 05.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var toggle = false
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.0)) {
                toggle.toggle()
            }
        } label: {
            HStack(spacing: -14) {
                if toggle {
                    Image(systemName: "play.fill")
                        .transition(
                            .scale(toggle ? 0 : 1, anchor: .leading)
                            .combined(with: .opacity)
                        )
                }
                
                Image(systemName: "play.fill")
                
                if !toggle {
                    Image(systemName: "play.fill")
                        .transition(
                            .scale(toggle ? 1 : 0, anchor: .trailing)
                            .combined(with: .opacity)
                        )
                }
            }
            .font(.system(size: 100))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
