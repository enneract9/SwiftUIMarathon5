//
//  ContentView.swift
//  SwiftUIMarathon5
//
//  Created by @_@ on 11.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State var position = CGPoint(
        x: UIScreen.main.bounds.width / 2,
        y: UIScreen.main.bounds.height / 2
    )
    
    var body: some View {
        square()
            .background(background())
            .ignoresSafeArea()
    }
    
    private func square() -> some View {
        let gesture = DragGesture().onChanged { gesture in position = gesture.location }
        
        return Color.white
            .blendMode(.difference)
            .overlay {
                Rectangle()
                    .overlay(.white.blendMode(.overlay))
                    .overlay(.black.blendMode(.overlay))
            }
            .blendMode(.saturation)
            .frame(width: 64, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .position(position)
            .gesture(gesture)
    }
    
    private func background() -> some View {
        GeometryReader { proxy in
            let colors: [Color] = [.white, .pink, .yellow, .black]
            let height = proxy.size.height / 4
            
            VStack(spacing: 0) {
                ForEach(colors, id: \.hashValue) { color in
                    Rectangle()
                        .fill(color)
                        .frame(height: height)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
