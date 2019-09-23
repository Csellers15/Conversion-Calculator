//
//  ViewController.swift
//  Conversion-Calculator
//
//  Created by Cole Sellers on 9/20/19.
//  Copyright © 2019 Cole Sellers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fromInput: DecimalMinusTextField!
    @IBOutlet weak var toInput: DecimalMinusTextField!
    
    var fromLength = LengthUnit.Meters
    var toLength = LengthUnit.Miles
    
    var fromVol = VolumeUnit.Liters
    var toVol = VolumeUnit.Gallons
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fromInput.clearsOnBeginEditing = true
        self.toInput.clearsOnBeginEditing = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
         view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let fromVal = Double(self.fromInput.text!)
        let convKey = LengthConversionKey(toUnits: toLength, fromUnits: fromLength)
        let toVal = fromVal! * lengthConversionTable[convKey]!
    }
    
    @IBAction func fromBeganEditing(_ sender: Any) {
        self.toInput.text = ""
    }
    
    @IBAction func tobeganEditing(_ sender: Any) {
        self.fromInput.text = ""
    }
    
    @IBAction func clearBtn(_ sender: Any) {
        self.fromInput.text = ""
        self.toInput.text = ""
    }
    
}

