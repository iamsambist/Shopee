//
//  ViewScreenCoordinator.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//


import SwiftUI

struct ViewScreenCoordinator: View {
    
    @StateObject private var coordinator = RouteCoordinator()
    
    @ViewBuilder
    var body: some View {
        Group {
            switch coordinator.currentScreen {
            case .splash:
                ViewSplash()
                    .environmentObject(coordinator)
            case .login:
                ViewLogin()
                    .environmentObject(coordinator)
            case .signUp:
                ViewSignUp()
                    .environmentObject(coordinator)
            case .startScreen:
                StartScreenView()
                    .environmentObject(coordinator)
            case .home:
                ViewHome()
            }
        }
    }
    
}
