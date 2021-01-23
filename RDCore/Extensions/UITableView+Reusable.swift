//
//  UITableView+Reusable.swift
//  RDCore
//
//  Created by Yoana Rios  on 2021-01-22.
//  Copyright © 2021 Yoana R. Rios Diaz. All rights reserved.
//

import UIKit

public extension UITableView {
    // MARK: - Register and DequeueReusableCell Reusable & NibReusable
    
    /// Register a NIB-Based `UITableViewCell` subclass (conforming to `NibReusable`)
    /// - parameter cellType: the `UITableViewCell` (`NibReusable` -conforming) subclass to register
    final func register<T: UITableViewCell>(cellType: T.Type) where T: NibReusable {
        self.register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Register a Class-Based `UITableViewCell` subclass (conforming to `Reusable`)
    /// - parameter cellType: the `UITableViewCell` (`Reusable`-conforming) subclass to register
    final func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
      self.register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    /// Returns a reusable `UITableViewCell` object for the class inferred by the return-type
    /// - parameter indexPath: The index path specifying the location of the cell.
    /// - parameter cellType: The cell class to dequeue
    /// - returns: A `Reusable`, `UITableViewCell` instance
    /// - note: The `cellType` parameter can generally be omitted and infered by the return type, except when your type is in a variable and cannot be determined at compile time.
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError( "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                            + "Check that the reuseIdentifier is set properly in your XIB/Storyboard and the cell is registered")
        }
        return cell
    }

    // MARK: - Register and dequeueReusableHeaderFooterView for Reusable & NibReusable
    
    /// Register a NIB-Based `UITableViewHeaderFooterView` subclass (conforming to `NibReusable`)
    /// - parameter headerFooterViewType: the `UITableViewHeaderFooterView` (`NibReusable` -conforming) subclass to register
    final func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type) where T: NibReusable {
        self.register(headerFooterViewType.nib, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }
  
   /// Register a Class-Based `UITableViewHeaderFooterView` subclass (conforming to `Reusable`)
   /// - parameter headerFooterViewType: the `UITableViewHeaderFooterView` (`Reusable`-confirming) subclass to register
    final func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type) where T: Reusable {
        self.register(headerFooterViewType.self, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

   /// Returns a reusable `UITableViewHeaderFooterView` object for the class inferred by the return-type
   /// - parameter viewType: The view class to dequeue
   /// - returns: A `Reusable`, `UITableViewHeaderFooterView` instance
   /// - note: The `viewType` parameter can generally be omitted and infered by the return type, except when your type is in a variable and cannot be determined at compile time.
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self) -> T? where T: Reusable {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
            fatalError("Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) matching type \(viewType.self). "
            + "Check that the reuseIdentifier is set properly in your XIB/Storyboard and the header/footer is registered")
        }
        return view
    }
}
