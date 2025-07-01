//
//  RouteCoordinator.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import Foundation

class RouteCoordinator: ObservableObject {
    
    @Published var currentScreen: AppScreen = .splash
    private(set) var screenStack: [AppScreen] = []
    
    func pushOrPopScreen(_ screen: AppScreen) {
        if let index = screenStack.firstIndex(of: screen) {
            screenStack = Array(screenStack.prefix(upTo: index + 1))
        } else {
            screenStack.append(screen)
        }
    }
    
    private func topScreen() -> AppScreen? {
          return screenStack.last
      }
      
      func navigate(to screen: AppScreen) {
          pushOrPopScreen(screen)
          currentScreen = topScreen() ?? .splash
      }
      
      func navigateBack() {
          if screenStack.count > 1 {
              screenStack.removeLast()
          }
          currentScreen = topScreen() ?? .splash
      }
    
}
