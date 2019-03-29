//
//  MovieListCoordinator.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 20/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

protocol MovieListCoordinatorDelegate: AnyObject {
  func requestMovieDetail(movie: Movie)
}

final class MovieListCoordinator: Coordinator {

  private let moviesService: MoviesServiceDelegate

  var childCoordinators: [Coordinator] = []

  var navigationController: UINavigationController

  init(navigationController: UINavigationController, moviesService: MoviesServiceDelegate = MoviesService()) {
    self.navigationController = navigationController
    self.navigationController.navigationBar.prefersLargeTitles = true
    self.moviesService = moviesService
  }

  func start() {
    let movieListViewController = MovieListViewController.instantiateViewController()
    movieListViewController.title = "Studio Ghibli"
    movieListViewController.moviesService = moviesService
    movieListViewController.requestMovieDetail = { [ weak self] movie in
        self?.requestMovieDetail(movie: movie)
    }
    navigationController.pushViewController(movieListViewController, animated: true)
  }

}

// MARK: MovieListCoordinatorDelegate
extension MovieListCoordinator: MovieListCoordinatorDelegate {

  func requestMovieDetail(movie: Movie) {
    let coordinator = MovieDetailCoordinator(navigationController: navigationController, movie: movie)
    coordinator.delegate = self
    childCoordinators.append(coordinator)
    coordinator.start()
  }

}

// MARK: - MovieDetailCoordinatorDelegate
extension MovieListCoordinator: MovieDetailCoordinatorDelegate {

  func movieDetailCoordinatorDidDismiss(coordinator: MovieDetailCoordinator) {
    removeChild(coordinator: coordinator)
  }

}
