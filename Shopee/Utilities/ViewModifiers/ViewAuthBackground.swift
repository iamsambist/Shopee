//
//  ViewAuthBackground.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import SwiftUI

struct ViewAuthBackground: ViewModifier {
 
    func body(content: Content) -> some View {
        ZStack {
            Image("authframe")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

extension View {
    
    func authBackground() -> some View {
        modifier(ViewAuthBackground())
    }
}

