//
//  UIViewController+Extensions.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 20/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

extension UIViewController {

  class var identifier: String {
    return String(describing: self)
  }

}
