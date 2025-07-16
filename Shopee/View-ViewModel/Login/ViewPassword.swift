//
//  ViewPassword.swift
//  Shopee
//
//  Created by MacBook Two on 16/07/2025.
//

import SwiftUI

struct PasswordScreen: View {
    @ObservedObject var viewModel: LoginViewModel
    @FocusState private var isFocused: Bool
    let onCancel: () -> Void

    var body: some View {
        
        VStack (alignment: .leading){
            
            Spacer()
            Text("Login")
                .font(.system(size: 47, weight: .bold, design: .default))
                .padding(.leading, 20)
                .padding(.bottom, 20)
            HStack {
                Text("Let's type a password to continue!")
                Image(systemName: "heart.fill")
                Spacer()
                    
            }
            .padding(.leading, 20)
            
            ZStack {
                VStack {
                    if viewModel.password.isEmpty {
                        Text("type a password")
                            .foregroundColor(.gray).opacity(0.7)
                    } else {
                        
                        HStack(spacing: 12) {
                            ForEach(0..<min(viewModel.password.count, 10), id: \.self) { _ in
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
                TextField("Password", text: $viewModel.password)
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
            
            CustomButton(buttonText: "Login", onClick: {
                viewModel.loginUser()
            })
                .padding(.horizontal, 16)
                .padding(.top, 20)
            
            HStack {
                Spacer()
                Button(action: {
                    onCancel()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.gray)
                        .font(.headline)
                        
                })
                Spacer()
            }
            .padding(.top, 10)
           
        }
        .padding(.bottom, 100)
        .authBackground()
        
      
    }
}

#Preview {
    PasswordScreen(viewModel: LoginViewModel(), onCancel: {})
}
