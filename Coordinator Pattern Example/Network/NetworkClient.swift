//
//  NetworkClient.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 19/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import Foundation

// https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
struct StatusCodeError: Error {
  var statusCode: Int
}

final class NetworkClient {

  // MARK: - Properties

  private let urlSession: URLSession

  // MARK: - Life cycle

  init(_ urlSession: URLSession = URLSession(configuration: .default)) {
    self.urlSession = urlSession
  }

  // MARK: - Request

  func request<T: Codable>(_ url: URL, output: T.Type, completion: @escaping (T?, Error?) -> Void) {
    let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
      do {
        if let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) {
          completion(nil, StatusCodeError(statusCode: response.statusCode))
        }

        guard let data = data, error == nil else {
          completion(nil, error)
          return
        }

        let dataList = try JSONDecoder().decode(T.self, from: data)
        completion(dataList, nil)
      } catch let error {
        completion(nil, error)
      }
    }
    dataTask.resume()
  }

}
