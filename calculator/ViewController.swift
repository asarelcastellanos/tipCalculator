//
//  ViewController.swift
//  calculator
//
//  Created by Asarel Castellanos on 8/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet var window: UIView!
    
    @IBOutlet weak var modeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total  = bill + tip
        
        //Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //Update total amount label
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    // added dark mode
    @IBAction func switchColor(_ sender: Any) {
        if(modeSwitch.isOn) {
            window.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }
}
