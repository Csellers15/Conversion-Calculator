//
//  ButtonColor.swift
//  Conversion-Calculator
//
//  Created by Xcode User on 9/30/19.
//  Copyright © 2019 Cole Sellers. All rights reserved.
//

import UIKit

class ButtonColor: UIButton {
    
    override func awakeFromNib() {
        self.backgroundColor = THEME_COLOR3
        self.tintColor = THEME_COLOR2
        self.layer.borderWidth = 1.0
        self.layer.borderColor = THEME_COLOR3.cgColor
        self.layer.cornerRadius = 5.0
    }
}
