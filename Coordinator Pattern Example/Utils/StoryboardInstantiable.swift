//
//  StoryboardInstantiable.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 25/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable: NSObjectProtocol {
  associatedtype ViewControllerType
  static func instantiateViewController(_ bundle: Bundle?) -> ViewControllerType
}

extension StoryboardInstantiable where Self: UIViewController {

  static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
    let storyboard = UIStoryboard(name: self.identifier, bundle: bundle)
    guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
      fatalError("Couldn't find UIViewController for \(self.identifier))")
    }
    return viewController
  }

}

// This makes every UIViewController instantiable from its storyboard
extension UIViewController: StoryboardInstantiable {}
