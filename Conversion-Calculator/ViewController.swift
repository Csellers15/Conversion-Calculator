//
//  ViewController.swift
//  Conversion-Calculator
//
//  Created by Cole Sellers on 9/20/19.
//  Copyright © 2019 Cole Sellers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsViewControllerDelegate {
    

    @IBOutlet weak var fromInput: DecimalMinusTextField!
    @IBOutlet weak var toInput: DecimalMinusTextField!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    var fromLength = LengthUnit.Yards
    var toLength = LengthUnit.Meters
    
    var fromVol = VolumeUnit.Liters
    var toVol = VolumeUnit.Gallons
    
    var mode = CalculatorMode.Length
    
    
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
        if(self.mode == .Length){
            if (self.fromInput.text != ""){
                let fromVal = Double(self.fromInput.text!)
                let convKey = LengthConversionKey(toUnits: toLength, fromUnits: fromLength)
                let toVal = fromVal! * lengthConversionTable[convKey]!
                self.toInput.text = String(toVal)
            } else {
                let toVal = Double(self.toInput.text!)
                let convKey = LengthConversionKey(toUnits: fromLength, fromUnits: toLength)
                let fromVal = toVal! * lengthConversionTable[convKey]!
                self.fromInput.text = String(fromVal)
            }
        } else {
            if (self.fromInput.text != ""){ }
            else {}
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
        if (mode == .Length){
              self.fromLabel.text! = "\(VolumeUnit.Gallons.rawValue)"
              self.toLabel.text! = "\(VolumeUnit.Liters)"
              mode = CalculatorMode.Volume
          } else{
              self.fromLabel.text! = "\(LengthUnit.Yards)"
              self.toLabel.text! = "\(LengthUnit.Meters)"
              mode = CalculatorMode.Length
          }
    }
    
    func settingsChanged(fromUnits: LengthUnit, toUnits: LengthUnit) {
        self.toLength = toUnits
        self.fromLength = fromUnits
        fromInput.placeholder = "Enter a length in \(self.fromLength)"
        toInput.placeholder = "Enter a length in \(self.toLength)"
        fromLabel.text = "\(self.fromLength)"
        toLabel.text = "\(self.toLength)"
    }
    
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit) {
        self.toVol = toUnits
        self.fromVol = fromUnits
        fromInput.placeholder = "Enter a length in \(self.fromVol)"
        toInput.placeholder = "Enter a length in \(self.toVol)"
        fromLabel.text = "\(self.fromVol)"
        toLabel.text = "\(self.toVol)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? UINavigationController{
            if let settings = dest.viewControllers[0] as? SettingsViewController{
                settings.delegate = self
                settings.mode = self.mode
                settings.fromLength = self.fromLength
                settings.toLength = self.toLength
                settings.fromVol = self.fromVol
                settings.toVol = self.toVol
            }
        }
    }
}
