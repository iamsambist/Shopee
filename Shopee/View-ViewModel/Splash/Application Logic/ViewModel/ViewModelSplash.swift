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
    private var service: SplashAPIServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    init(service: SplashAPIServiceProtocol) {
        self.service = service
    }
    
    func fetchImage() {
        performRequest(publisher: service.fetchSplashImages()) { images in
            
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
}
