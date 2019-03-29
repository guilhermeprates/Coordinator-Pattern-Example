//
//  UITableView+Extensions.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 20/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

extension UITableView {

  func removeTableFooterView() {
    tableFooterView = nil
  }

  func removeTableHeaderView() {
    tableHeaderView = nil
  }

  func removeSeparator() {
    separatorStyle = UITableViewCell.SeparatorStyle.none
  }

  func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
      fatalError("Couldn't find UITableViewCell for \(T.identifier))")
    }
    return cell
  }

  func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Couldn't find UITableViewCell for \(T.identifier)")
    }
    return cell
  }

  func register<T: UITableViewCell>(cellWithClass name: T.Type) {
    register(T.self, forCellReuseIdentifier: T.identifier)
  }

  func register<T: UITableViewCell>(nib: UINib?, withCellClass name: T.Type) {
    register(nib, forCellReuseIdentifier: T.identifier)
  }

  func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
    var bundle: Bundle?

    if let bundleName = bundleClass {
      bundle = Bundle(for: bundleName)
    }

    register(UINib(nibName: T.identifier, bundle: bundle), forCellReuseIdentifier: T.identifier)
  }

}
