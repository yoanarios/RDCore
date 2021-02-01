//
//  Coordinator.swift
//  RDCore
//
//  Created by Yoana Rios  on 2021-01-31.
//  Copyright © 2021 Yoana R. Rios Diaz. All rights reserved.
//

import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
