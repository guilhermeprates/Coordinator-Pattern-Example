//
//  GhibliAPI.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 04/04/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import Foundation

struct GhibiliAPI {

  private let baseURL = URL(string: "https://ghibliapi.herokuapp.com")

  var moviesRequest: Request {
    return Request(method: .get, baseURL: baseURL, path: "/films")
  }

}
