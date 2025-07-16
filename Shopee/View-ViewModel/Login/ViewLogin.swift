//
//  SwiftUIView.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import SwiftUI

struct ViewLogin: View {
    @EnvironmentObject var coordinator: RouteCoordinator
    @StateObject private var viewModel = LoginViewModel()
    @State private var showPassword = false
    var body: some View {
        if showPassword {
            withAnimation {
                PasswordScreen(viewModel: viewModel) {
                    showPassword.toggle()
                }
            }
           
        } else {
            
            withAnimation {
                ViewEmail(viewModel: viewModel, coordinator: coordinator) {
                    showPassword.toggle()
                }
            }
        }
   
    }
}

#Preview {
    ViewLogin()
}



