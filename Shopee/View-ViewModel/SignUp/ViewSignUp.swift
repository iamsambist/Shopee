//
//  ViewSignUp.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import SwiftUI

struct ViewSignUp: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack (alignment: .topLeading){
            Image("bubbles")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Create \n Account")
                    .padding(.top, 120)
                    .padding(.leading, 16)
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .padding(.bottom, 50)
                
                Image("uplodaphoto")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(.leading, 16)
                    .padding(.bottom, 32)
                
                CustomTextField(text: $email)
                    .padding(.horizontal, 16)
                CustomTextField(text: $password, placeHolderText: "Password")
                    .padding(.horizontal, 16)
                    .padding(.bottom, 30)
                CustomButton(buttonText: "Done", onClick: {})
                    .padding(.horizontal, 16)
                    .padding(.bottom, 5)
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    })
                    Spacer()
                }
                
            }
        }
        .transition(.move(edge: .trailing))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .edgesIgnoringSafeArea(.all)
       
    }
}

#Preview {
    ViewSignUp()
}
