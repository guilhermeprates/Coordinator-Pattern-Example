//
//  NetworkClient.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 19/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
  case get = "GET"
  case put = "PUT"
  case post = "POST"
  case delete = "DELETE"
  case head = "HEAD"
  case options = "OPTIONS"
  case trace = "TRACE"
  case connect = "CONNECT"
}

struct HTTPHeader {

  let field: String

  let value: String

}

struct Request {

  let method: HTTPMethod

  let baseURL: URL?

  let path: String

  var queryItems: [URLQueryItem]?

  var headers: [HTTPHeader]?

  var body: Data?

  init(method: HTTPMethod, baseURL: URL?, path: String) {
    self.method = method
    self.baseURL = baseURL
    self.path = path
  }

}

enum NetworkError: Error {
  case invalidURL
  case requestFailed(code: Int)
  case decodeFailed
}

final class NetworkClient {

  // MARK: - Properties

  private let urlSession: URLSession

  // MARK: - Life cycle

  init(_ urlSession: URLSession = URLSession.shared) {
    self.urlSession = urlSession
  }

  // MARK: - Request

  func request<T: Codable>(_ request: Request, output: T.Type,
                           completion: @escaping (Result<T, NetworkError>) -> Void) {

    var urlComponents = URLComponents()
    urlComponents.scheme = request.baseURL?.scheme
    urlComponents.host = request.baseURL?.host
    urlComponents.queryItems = request.queryItems

    guard let url = urlComponents.url?.appendingPathComponent(request.path) else {
      completion(.failure(.invalidURL))
      return
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = request.method.rawValue
    urlRequest.httpBody = request.body

    let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
      do {
        if let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) {
          completion(.failure(.requestFailed(code: response.statusCode)))
        }

        guard let data = data, error == nil else {
          completion(.failure(.decodeFailed))
          return
        }

        let output = try JSONDecoder().decode(T.self, from: data)
        completion(.success(output))
      } catch {
        completion(.failure(.decodeFailed))
      }
    }
    dataTask.resume()
  }

}
