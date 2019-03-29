//
//  Coordinator.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 19/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get }
  
  func start()
}

extension Coordinator {

  func removeChild(coordinator: Coordinator) {
    childCoordinators.enumerated().forEach { index, childCoordinator in
      if coordinator === childCoordinator {
        childCoordinators.remove(at: index)
      }
    }
  }

}

protocol RootCoordinator: AnyObject {
  var window: UIWindow { get }
  var rootViewController: UINavigationController { get }

  func start()
}
