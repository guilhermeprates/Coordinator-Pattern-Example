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

  private let APIEndPoint: String = baseURL+"/films"
  
  private var networkClient: NetworkClient

  // MARK: - Life cycle

  init() {
    networkClient = NetworkClient()
  }

}

// MARK: - MoviesServiceDelegate
extension MoviesService: MoviesServiceDelegate {

  func fetchMovies(_ completion: @escaping FetchMoviesCompletion) {
    guard let url = URL(string: APIEndPoint) else {
      completion([], "This is not a valid URL.")
      return
    }

    networkClient.request(url, output: Movies.self) { movies, error in
      if let movies = movies {
        completion(movies, nil)
      } else if let error = error {
        completion([], error.localizedDescription)
      }
    }
  }

}
