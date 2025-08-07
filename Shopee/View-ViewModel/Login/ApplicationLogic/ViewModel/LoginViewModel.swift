//
//  LoginViewModel.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    private var cancellables: Set<AnyCancellable> = []
    let service: SignUpProtocol
    
    init(service: SignUpProtocol = SignUpService()) {
        self.service = service
    }
    
    func loginUser(){
        if email.isEmpty || password.isEmpty {
            return
        }
        service.loginUser(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Request failed: \(error.localizedDescription)")
                }
            },
                receiveValue: { [self] response in
                    print("yo you logged in \(response)")
                    
            })
            .store(in: &cancellables)
    }
    
}
