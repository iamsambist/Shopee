//
//  ViewModelSplash.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import Foundation
import UIKit.UIImage
import Combine

final class ViewModelSplash: ObservableObject {
    @Published var displayImage: UIImage?
    @Published var errorMessage: String?
    @Published var moveToNextScreen: Bool = false
    private var service: SplashAPIServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    @Published var images: [SplashImageData] = []
    let shoppingItems = [
        "T-shirts",
        "Jeans",
        "Jackets",
        "Dresses",
        "Sweaters",
        "Shoes",
        "Sneakers",
        "Hats",
        "Scarves",
        "Socks",
        "Coats",
        "Blouses",
        "Skirts",
        "Shorts",
        "Bags"
    ]

    init(service: SplashAPIServiceProtocol) {
        self.service = service
    }
    
    func fetchImage() {
        let searchkeyIndex = Int.random(in: 0..<self.shoppingItems.count)
        
        service.fetchSplashImages(searchKey: shoppingItems[searchkeyIndex])
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
                receiveValue: { [self] images in
                    self.images = images
                    self.moveToNextScreen = true
                }
            )
            .store(in: &cancellables)

    }
    
   func getImage() -> String {
        let index = Int.random(in: 0..<images.count)
       return images[index].largeImageURL ?? ""
    }
}
