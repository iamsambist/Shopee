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
        performRequest(publisher: service.fetchSplashImages(searchKey: shoppingItems[searchkeyIndex])) { images in
            self.images = images
            self.moveToNextScreen = true
        }
    }
    
    private func performRequest<T>(
        publisher: AnyPublisher<T, Error>,
        successAction: @escaping (T) -> Void
    ) {
//        setLoadingState(true)
        
        publisher
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.handleCompletion(completion)
                },
                receiveValue: { value in
                    successAction(value)
                }
            )
            .store(in: &cancellables)
    }
    
    private func handleCompletion(_ completion: Subscribers.Completion<Error>) {
//          isLoading = false
          
          switch completion {
          case .finished:
              break
          case .failure(let error):
              errorMessage = "Request failed: \(error.localizedDescription)"
          }
      }
   func getImage() -> String {
        let index = Int.random(in: 0..<images.count)
       return images[index].largeImageURL ?? ""
    }
}
