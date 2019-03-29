//
//  MovieDetailCoordinator.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 26/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

protocol MovieDetailCoordinatorDelegate: AnyObject {
  func movieDetailCoordinatorDidDismiss(coordinator: MovieDetailCoordinator)
}

final class MovieDetailCoordinator: Coordinator {

  private let navigationControllerObserver: NavigationControllerObserver

  private let movie: Movie

  var childCoordinators: [Coordinator] = []

  var navigationController: UINavigationController

  weak var delegate: MovieDetailCoordinatorDelegate?

  init(navigationController: UINavigationController, movie: Movie) {
    self.navigationController = navigationController
    self.navigationControllerObserver = NavigationControllerObserver(navigationController: navigationController)
    self.movie = movie
  }

  func start() {
    let viewController = MovieDetaiViewController.instantiateViewController()
    viewController.movie = movie
    navigationController.pushViewController(viewController, animated: true)
    navigationControllerObserver.observePopTransition(of: viewController, delegate: self)
  }
  
}

// MARK: - NavigationControllerObserverDelegate
extension MovieDetailCoordinator: NavigationControllerObserverDelegate {

  func navigationControllerObserver(_ observer: NavigationControllerObserver,
                                    didObservePopTransitionFor viewController: UIViewController) {
    delegate?.movieDetailCoordinatorDidDismiss(coordinator: self)
  }

}
