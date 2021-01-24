//
//  StoryboardBased.swift
//  RDCore
//
//  Created by Yoana Rios  on 2021-01-22.
//  Copyright © 2021 Yoana R. Rios Diaz. All rights reserved.
//

import UIKit

public protocol StoryboardBased: class {
  /// The UIStoryboard to use when we want to instantiate this ViewController
  static var storyboardName: String { get }
  /// The scene identifier to use when we want to instantiate this ViewController from its associated Storyboard
  static var sceneIdentifier: String { get }
}

extension StoryboardBased {
    /// By default, use the storybaord with the same name as the class

    static var storyboardName: String {
        return String(describing: self)
    }
}

// MARK: Support for instantiation from Storyboard
public extension StoryboardBased where Self: UIViewController {

    /// Create an instance of the initialViewController ViewController from its storyboardName `storyboardName` or `sceneIdentifier`
    /// - Returns: instance of the conforming UIViewController
    static func instantiate(isInitialViewController: Bool = false) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))

        let viewController = isInitialViewController ? storyboard.instantiateInitialViewController() : storyboard.instantiateViewController(withIdentifier: self.sceneIdentifier)

        guard let typedViewController = viewController as? Self else {
            fatalError("The initialViewController with name: '\(storyboardName)' is not of class '\(self)'")
        }
        return typedViewController
    }
}
