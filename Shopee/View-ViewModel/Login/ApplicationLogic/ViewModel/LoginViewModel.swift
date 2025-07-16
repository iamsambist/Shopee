//
//  LoginViewModel.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func loginUser() {
        print("user logged in")
    }
}
