//
//  ContentView.swift
//  MatrixRainSwiftUI
//
//  Created by Nazar Babyak on 06.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
    
            LinearGradient(colors: [
                .black,
                .black.opacity(0.9),
                .black.opacity(0.7),
                .black.opacity(0.6),
                .black.opacity(0.6),
                .black.opacity(0.7),
                .black.opacity(0.8),
                .black
            ], startPoint: .top, endPoint: .bottom)
            MatrixRainView(color: Color.yellow,duration: 12)
            MatrixRainView(color: Color.blue,duration: 10)

        }
        .background(
            Image("photo")
                .resizable()
                .scaledToFill()
        )
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
