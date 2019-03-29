//
//  ApplicationCoordinator.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 19/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

class AppCoordinator: RootCoordinator {

  private var movieListCoordinator: MovieListCoordinator?

  var window: UIWindow

  var rootViewController: UINavigationController

  init(window: UIWindow) {
    self.window = window
    rootViewController = UINavigationController()
    rootViewController.navigationBar.prefersLargeTitles = true
    movieListCoordinator = MovieListCoordinator(navigationController: rootViewController)

  }

  func start() {
    window.rootViewController = rootViewController
    movieListCoordinator?.start()
    window.makeKeyAndVisible()
  }

}
