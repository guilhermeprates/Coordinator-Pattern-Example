//
//  UITableViewCell+Extensions.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 20/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

extension UITableViewCell {

  @objc
  class func height() -> CGFloat {
    return 44.0
  }

  func removeSelectionStyle() {
    selectionStyle = UITableViewCell.SelectionStyle.none
  }

}
