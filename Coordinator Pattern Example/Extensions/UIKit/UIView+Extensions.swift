//
//  UIView+Extensions.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 20/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

extension UIView {

  class var identifier: String {
    return String(describing: self)
  }

  @IBInspectable var borderColor: UIColor? {
    get {
      guard let color = layer.borderColor else { return nil }
      return UIColor(cgColor: color)
    }
    set {
      guard let color = newValue else {
        layer.borderColor = nil
        return
      }
      layer.borderColor = color.cgColor
    }
  }

  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }

  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.masksToBounds = true
      layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
    }
  }

  @IBInspectable var shadowColor: UIColor? {
    get {
      guard let color = layer.shadowColor else { return nil }
      return UIColor(cgColor: color)
    }
    set {
      guard let color = newValue else {
        layer.shadowColor = nil
        return
      }
      layer.shadowColor = color.cgColor
    }
  }

  @IBInspectable var shadowOpacity: Float {
    get {
      return layer.shadowOpacity
    }
    set {
      layer.shadowOpacity = newValue
    }
  }

  @IBInspectable var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set {
      layer.shadowOffset = newValue
    }
  }

}

extension UIView {

  class func loadFromNibNamed(_ nibNamed: String, _ bundle: Bundle? = nil) -> UINib {
    return UINib(nibName: nibNamed, bundle: bundle)
  }

  class func loadNib(_ bundle: Bundle? = nil) -> UINib {
    return loadFromNibNamed(identifier, bundle)
  }

  class func loadFromNib(bundle: Bundle? = nil) -> UIView? {
    return loadFromNibNamed(identifier, bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
  }

}
