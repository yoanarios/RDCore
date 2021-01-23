//
//  NibLoadable.swift
//  RDCore
//
//  Created by Yoana Rios  on 2021-01-22.
//  Copyright © 2021 Yoana R. Rios Diaz. All rights reserved.
//

import UIKit

/// Make your UIView subclasses conform to this protocol when:
/// they *are* NIB-based, and this class is used as the XIB's root view
public protocol NibLoadable: class {
  /// The nib file to use to load a new instance of the View designed in a XIB
  static var nib: UINib { get }
}

public extension NibLoadable {
  /// By default, use the nib which have the same name as the name of the class,
  /// and located in the bundle of that class
  static var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }
}

public extension NibLoadable where Self: UIView {
    /// Returns a `UIView` object instantiated from nib file
    /// - Returns:`NibLoadable`, `UIView` instance
  static func loadFromNib() -> Self {
    guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
        fatalError("The root view of the nib \(nib) is not of type \(self)")
    }
    return view
  }
}
