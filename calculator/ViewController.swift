//
//  ViewController.swift
//  calculator
//
//  Created by Asarel Castellanos on 8/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard;
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet var window: UIView!
    
    @IBOutlet weak var modeSwitch: UISwitch!
    
    var tip1 = 15.0;
    var tip2 = 18.0;
    var tip3 = 20.0;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: "darkMode") {
            window.overrideUserInterfaceStyle = .dark;
        } else {
            window.overrideUserInterfaceStyle = .light;
        }
        
        tip1 = defaults.double(forKey: "tip1");
        tip2 = defaults.double(forKey: "tip2");
        tip3 = defaults.double(forKey: "tip3");
        
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "Tip Calculator";
        
        tipControl.setTitle(String(format: "%.2f%%", tip1), forSegmentAt: 0);
        tipControl.setTitle(String(format: "%.2f%%", tip2), forSegmentAt: 1);
        tipControl.setTitle(String(format: "%.2f%%", tip3), forSegmentAt: 2);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0;
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [tip1/100, tip2/100, tip3/100];
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex];
        let total = bill + tip;
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip);
        
        // sUpdate total amount label
        totalLabel.text = String(format: "$%.2f", total);
    
    }
    
}
