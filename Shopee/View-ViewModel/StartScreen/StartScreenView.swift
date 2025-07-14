//
//  StartScreenView.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import SwiftUI

struct StartScreenView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 120, height: 120)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    
                Image("bag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
            }
            .padding(.bottom, 20)
            
            Text("Shopee")
                .font(.system(size: 42, weight: .bold, design: .default))
                .foregroundColor(.black)
                .padding(.bottom, 10)
            
            Text("Discover the best deals, handpicked just for you.")
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
            
            CustomButton(buttonText: "Let's get started", onClick: {})
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            HStack {
                Text("I already have an account")
                Image("arrowright")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
            
        }
    }
}

#Preview {
    StartScreenView()
}
