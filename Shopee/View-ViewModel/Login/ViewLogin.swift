//
//  SwiftUIView.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import SwiftUI

struct ViewLogin: View {
    @EnvironmentObject private var coordinator: RouteCoordinator
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                Spacer()
                Text("Login")
                    .font(.system(size: 47, weight: .bold, design: .default))
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                HStack {
                    Text("Good to see you back!")
                    Image(systemName: "heart.fill")
                    Spacer()
                        
                }
                .padding(.leading, 20)
                
                CustomTextField(text: $viewModel.email)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                CustomTextField(text: $viewModel.password, placeHolderText: "Password")
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                CustomButton(onClick: {
                    viewModel.loginUser()
                })
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                HStack {
                    Spacer()
                    Button(action: {
                        coordinator.navigate(to: .startScreen)
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.gray)
                            .font(.headline)
                            
                    })
                    Spacer()
                }
                .padding(.bottom, 100)
              
            }
        }
        .authBackground()
   
    }
}

#Preview {
    ViewLogin()
}



