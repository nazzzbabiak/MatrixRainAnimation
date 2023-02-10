//
//  MatrixRainView.swift
//  MatrixRainSwiftUI
//
//  Created by Nazar Babyak on 06.02.2023.
//

import SwiftUI

struct MatrixRainView: View {
    
    let color: Color
    let duration: Double
    
    var body: some View {
        GeometryReader { proxy in
             
            let size = proxy.size
            
            HStack(spacing: 10) {
                ForEach(1...Int(size.width / 20),id: \.self) { _ in
                    MatrixRainCharacters(duration: duration, color: color, size: size)
                }
            }
            .padding(.horizontal, 5)
        }
    }
}

struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let constant = "01010101010100101010100101010010101010100101"
