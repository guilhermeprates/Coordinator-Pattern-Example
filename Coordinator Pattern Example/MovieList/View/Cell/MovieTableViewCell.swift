//
//  MovieTableViewCell.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 20/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!

  @IBOutlet weak var descriptionLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    accessoryType = AccessoryType.disclosureIndicator
    removeSelectionStyle()
  }

  override class func height() -> CGFloat {
    return 100.0
  }

}
