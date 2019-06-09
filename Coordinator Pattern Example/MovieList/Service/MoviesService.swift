//
//  MoviesService.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 19/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import Foundation

typealias FetchMoviesCompletion = (_ movies: Movies, _ error: String?) -> Void

protocol MoviesServiceDelegate: AnyObject {
  func fetchMovies(_ completion: @escaping FetchMoviesCompletion)
}

final class MoviesService {

  // MARK: - Properties

  private let api: GhibiliAPI
  
  private let networkClient: NetworkClient

  // MARK: - Life cycle

  init() {
    networkClient = NetworkClient()
    api = GhibiliAPI()
  }

}

// MARK: - MoviesServiceDelegate
extension MoviesService: MoviesServiceDelegate {

  func fetchMovies(_ completion: @escaping FetchMoviesCompletion) {
    networkClient.request(api.moviesRequest, output: Movies.self) { result in
      switch result {
      case .success(let movies):
        completion(movies, nil)
      case .failure(let error):
        completion([], error.localizedDescription)
      }
    }
  }

}
