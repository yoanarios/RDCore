//
//  BaseViewController.swift
//  RDCore
//
//  Created by Yoana R. Rios Diaz on 2020-09-25.
//  Copyright © 2020 Yoana R. Rios Diaz. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    open func setupUI() {
        // Setup UI from ViewModel
    }
    
    open func applyStyle() {
        // Apply font, colors etc...
    }
    
    open func updateUI() {
        // Update UI when the data is fetch, coming back from background etc
    }
}
