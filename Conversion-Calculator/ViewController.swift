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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fromInput.clearsOnBeginEditing = true
        self.toInput.clearsOnBeginEditing = true
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if(self.fromInput.text! != ""){
            let value = Double(self.fromInput.text!)
            self.toInput.text = String(0.9144 / value!)
        } else if(self.toInput.text! != ""){
            let value = Double(self.toInput.text!)
            self.fromInput.text = String (value! * 1.0936)
        } else {
            self.fromInput.text = String(0)
            self.toInput.text = String(0)
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
}

