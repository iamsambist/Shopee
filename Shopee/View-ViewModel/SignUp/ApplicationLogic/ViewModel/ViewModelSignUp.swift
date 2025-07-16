//
//  ViewModelSignUp.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import UIKit
import Combine

final class ViewModelSignUp: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSheetPresented: Bool = false
    @Published var selectedImage: UIImage?
    @Published var avatarURL: String? = nil
    @Published var avatarname: String = ""
    @Published var avatarnameResponse: String? = nil
    @Published var imageUploadStatus: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    private var service: SignUpProtocol
   
    init(service: SignUpProtocol) {
        self.service = service
    }
    
    
    func uploadImage() {
        
        if let imageData = selectedImage?.jpegData(compressionQuality: 0.8) {
            let upload = FileUploadRequest(fileData: imageData, fileName: avatarname.isEmpty ? "avatar.jpg" : "\(avatarname).jpg", mimeType: "image/jpeg", token: nil)
            let request = upload.asURLRequest()
            
            service.uploadImageData(with: request)
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
                    receiveValue: { [self] fileData in
                        avatarURL = fileData.downloadPage
                        avatarnameResponse = fileData.name
                        imageUploadStatus = true
                })
                .store(in: &cancellables)
        }
    }
    
    func registerUser(router: RouteCoordinator) {
        let user = UserParams(username: username, useremail: email, userpassword: password, userImage: "\(avatarURL ?? "")")
        service.registerUser(with: user)
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
                receiveValue: { data in
                    print("registration successfull")
                    print("DATA: \(data)")
                    router.navigate(to: .home)
                })
            .store(in: &cancellables)
        
    }
    
}
