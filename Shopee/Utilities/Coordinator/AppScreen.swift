//
//  AppScreens.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import Foundation

indirect enum AppScreen: Equatable {
    
    case splash
    case login
    case signUp
    
    static func == (lhs: AppScreen, rhs: AppScreen) -> Bool {
        switch (lhs, rhs) {
        case (.splash, .splash),
            (.login, .login),
            (.signUp, .signUp):
            return true
        default:
            return false
        }
    }
}


