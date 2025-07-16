//
//  ViewPassword.swift
//  Shopee
//
//  Created by MacBook Two on 16/07/2025.
//

import SwiftUI

struct PasswordScreen: View {
    @State private var password: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        
        VStack {
            
            Spacer()
            Image(systemName: "lock.document.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 50)
            
            VStack {
                HStack (spacing: 10){
                    Rectangle()
                        .frame(width: 45, height: 8)
                    Rectangle()
                        .frame(width: 45, height: 8)
                    Rectangle()
                        .frame(width: 45, height: 8)
                }
                .padding(.top, 10)
                Text("Last Step: ")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.bottom, 25)
            }
            
            Text("Set a password to continue")
                .padding(.bottom, 3)
            Text("password must only contains letter and worlds in between 4 to 10 characters.")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.bottom, 30)
            
            ZStack {
                VStack {
                    if password.isEmpty {
                        Text("type a password")
                            .foregroundColor(.gray).opacity(0.7)
                    } else {
                        
                        HStack(spacing: 12) {
                            ForEach(0..<min(password.count, 10), id: \.self) { _ in
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
                TextField("Password", text: $password)
                    .keyboardType(.asciiCapable)
                    .textContentType(.password)
                    .focused($isFocused)
                    .opacity(0)
               
            }
            .frame(height: 44)
            .contentShape(Rectangle())
            .onTapGesture {
                isFocused = true
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white) // Change to desired background color
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal, 16)
            
            CustomButton(buttonText: "Register", onClick: {})
                .padding(.horizontal, 16)
                .padding(.top, 20)
            Spacer()
        }
        .authBackground()
        
      
    }
}

#Preview {
    PasswordScreen()
}
