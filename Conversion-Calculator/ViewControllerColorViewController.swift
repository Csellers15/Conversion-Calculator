//
//  ViewControllerColorViewController.swift
//  Conversion-Calculator
//
//  Created by Xcode User on 9/30/19.
//  Copyright © 2019 Cole Sellers. All rights reserved.
//

import UIKit

    class ViewControllerColorViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = THEME_COLOR2
            self.setNeedsStatusBarAppearanceUpdate()
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
}
