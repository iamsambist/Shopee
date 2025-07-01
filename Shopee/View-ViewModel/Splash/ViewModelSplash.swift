//
//  ViewModelSplash.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import Foundation
import UIKit.UIImage

final class ViewModelSplash: ObservableObject {
    @Published var displayImage: UIImage?
    private var apiService: NetworkService?
    
    init(apiService: NetworkService) {
        self.apiService = apiService
    }
    
    func fetchImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.displayImage = UIImage(named: "splash")
        }
    }
}
