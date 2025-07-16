//
//  ViewEmail.swift
//  Shopee
//
//  Created by MacBook Two on 16/07/2025.
//

import SwiftUI

struct ViewEmail: View {
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var coordinator: RouteCoordinator
    let onClick: () -> Void
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
                    .padding(.bottom, 20)
                
                CustomButton(onClick: {
                    onClick()
                })
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                HStack {
                    Spacer()
                    Text("Didn't have an account")
                    Image("arrowright")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            withAnimation {
                                coordinator.navigate(to: .signUp)
                            }
                        }
                    Spacer()
                }
                .padding(.horizontal, 16)
               
                
              
            }
        }
        .padding(.bottom, 80)
        .authBackground()
    }
}

#Preview {
    ViewEmail(viewModel: LoginViewModel(), coordinator: RouteCoordinator(), onClick: {})
}
