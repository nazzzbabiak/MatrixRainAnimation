//
//  MatrixRainCharacters.swift
//  MatrixRainSwiftUI
//
//  Created by Nazar Babyak on 06.02.2023.
//

import SwiftUI

struct MatrixRainCharacters: View {
    
    let duration: Double
    
    let color: Color
    
    var size: CGSize
    @State private var startAnimation: Bool = false
    
    @State private var random: Int = 0
    
    var body: some View {
        
        let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
        
        VStack {
            ForEach(0..<constant.count, id: \.self) { index in
                
                let character = Array(constant)[getRandomIndex(index: index)]
                
                Text(String(character))
                    .font(.system(size: 20, weight: .light, design: .rounded))
                    .foregroundColor(color)
            }
        }
        .mask(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        .clear,
                        .black.opacity(0.9),
                        .black.opacity(0.4),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                        .black.opacity(0.9),
                        .black
                        
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(height: size.height / 2)
            
                .offset(y: startAnimation ? size.height : -randomHeight )
        }
        .onAppear {
            withAnimation(.linear(duration: duration).delay(.random(in: 0...4)).repeatForever(autoreverses: false)) {
                startAnimation = true
            }
        }
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
            
            random = Int.random(in: 0..<constant.count)
        }
    }
}

extension MatrixRainCharacters {
    
    private func getRandomIndex(index: Int)->Int {
        
        let max = constant.count - 1
        
        if (index + random) > max {
            if (index - random) < 0 {
                return index
            }
            return (index - random)
        }
        else {
            return (index + random)
        }
    }
}
