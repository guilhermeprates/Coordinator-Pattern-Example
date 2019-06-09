//
//  MovieDetailTableViewCell.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 30/03/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {

  override func awakeFromNib() {
    super.awakeFromNib()
    removeSelectionStyle()
  }

  override class func height() -> CGFloat {
    return 88.0
  }

}
