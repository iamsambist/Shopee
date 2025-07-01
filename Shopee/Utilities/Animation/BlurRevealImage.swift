//
//  BlurRevealImage.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import SwiftUI

import SwiftUI

struct BlurRevealImage: View {
    let imageName: String
    let animationDuration: Double

    @State private var animate = false

    var body: some View {
        ZStack {
    
            Image(imageName)
                .resizable()
                .scaledToFit()
                .blur(radius: 15)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: animate ? 0.0 : 1.0),
                            .init(color: .black, location: animate ? 1.0 : 1.0)
                        ]),
                        startPoint: .trailing,
                        endPoint: .leading
                    )
                )
                .animation(.easeInOut(duration: animationDuration), value: animate)
        }
        .onAppear {
            animate = true
        }
    }
}
