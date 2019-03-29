//
//  Movie.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 19/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import Foundation

typealias Movies = [Movie]

struct Movie: Codable {

  let id: String

  let title: String

  let description: String

  let director: String

  let producer: String

  let releaseDate: String

  let score: String

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case description
    case director
    case producer
    case releaseDate = "release_date"
    case score = "rt_score"
  }
  
}
