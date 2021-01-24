//
//  BaseChildViewController.swift
//  RDCore
//
//  Created by Yoana R. Rios Diaz on 2020-09-25.
//  Copyright © 2020 Yoana R. Rios Diaz. All rights reserved.
//

import UIKit

public protocol BaseChildViewControllerProtocol {
    associatedtype ViewModelType
    func configure(viewModel: ViewModelType)
    func updateView(viewModel: ViewModelType)
}

open class BaseChildViewController<ViewModelType>: BaseViewController, BaseChildViewControllerProtocol {

    open func configure(viewModel: ViewModelType) {
        setupUI()
        applyStyle()
    }

    open func updateView(viewModel: ViewModelType) {
        updateUI()
    }
}
