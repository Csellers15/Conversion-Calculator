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
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    var fromLength = LengthUnit.Meters
    var toLength = LengthUnit.Miles
    
    var fromVol = VolumeUnit.Liters
    var toVol = VolumeUnit.Gallons
    
    var mode : Bool = false
    
    
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
        if (self.fromInput.text != ""){
            let fromVal = Double(self.fromInput.text!)
            let convKey = LengthConversionKey(toUnits: toLength, fromUnits: fromLength)
            let toVal = fromVal! * lengthConversionTable[convKey]!
            self.toInput.text = String(toVal)
        }
        else {
            let toVal = Double(self.toInput.text!)
            let convKey = LengthConversionKey(toUnits: fromLength, fromUnits: toLength)
            let fromVal = toVal! * lengthConversionTable[convKey]!
            self.fromInput.text = String(fromVal)
        }
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
    
    @IBAction func modeChange(_ sender: Any) {
        if (mode == true){
            self.fromLabel.text! = "\(VolumeUnit.Gallons.rawValue)"
            self.toLabel.text! = "\(VolumeUnit.Liters)"
            mode = false
        }
        else{
            //self.fromLabel.text! = LengthUnit.Yards
            //self.toLabel.text! = LengthUnit.Meters
            mode = true
        }
    }
}
