//
//  NibOwnerLoadable.swift
//  RDCore
//
//  Created by Yoana Rios  on 2021-01-22.
//  Copyright © 2021 Yoana R. Rios Diaz. All rights reserved.
//

import UIKit

/// Make your UIView subclasses conform to this protocol when:
/// they are NIB-based, and this class is used as the XIB's File's Owner
public protocol NibOwnerLoadable: class {
    /// The nib file to use to load a new instance of the View designed in a XIB
    static var nib: UINib { get }
}

// MARK: Default implementation
public extension NibOwnerLoadable {
    /// By default, use the nib which have the same name as the name of the class,
    /// and located in the bundle of that class
    static var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// MARK: Support for instantiation from NIB
public extension NibOwnerLoadable where Self: UIView {

    // Adds content loaded from the nib to the end of the receiver's list of subviews and adds constraints automatically.
    func loadNibContent() {
        let layoutAttributes: [NSLayoutConstraint.Attribute] = [.top, .leading, .bottom, .trailing]

        for case let view as UIView in type(of: self).nib.instantiate(withOwner: self, options: nil) {
          view.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(view)
          NSLayoutConstraint.activate(layoutAttributes.map { attribute in
            NSLayoutConstraint(item: view,
                               attribute: attribute,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: attribute,
                               multiplier: 1,
                               constant: 0.0)
          })
        }
    }
}
