//
//  ContainerViewController.swift
//  RDCore
//
//  Created by Yoana R. Rios Diaz on 2020-09-25.
//  Copyright © 2020 Yoana R. Rios Diaz. All rights reserved.
//

import UIKit

protocol ContainerViewControllerProtocol {
    func addChildViewController(containerView: UIView)
    func removeChildViewController()
}

extension ContainerViewControllerProtocol where Self: UIViewController {
    func addChildViewController(containerView: UIView) {
        // Add to container view and setup constraints
//        containerView.addSubview(self)
    }

    func removeChildViewController() {
        // Remove from container view and setup constraints
    }
}
