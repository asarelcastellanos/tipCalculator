//
//  SettingsViewController.swift
//  calculator
//
//  Created by Asarel Castellanos on 8/27/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard;

    @IBOutlet var window: UIView!;
    @IBOutlet weak var DarkModeSwtich: UISwitch!;
    
    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: "darkMode") {
            window.overrideUserInterfaceStyle = .dark;
            DarkModeSwtich.setOn(true, animated: true)
        }
        
        tip1Field.text = "15%";
        defaults.set(15.0, forKey: "tip1");
        tip2Field.text = "18%";
        defaults.set(18.0, forKey: "tip2");
        tip3Field.text = "20%";
        defaults.set(20.0, forKey: "tip3");
    }
    
    // Added dark mode
    @IBAction func switchMode(_ sender: Any) {

        if(DarkModeSwtich.isOn) {
            window.overrideUserInterfaceStyle = .dark;
            defaults.set(true, forKey: "darkMode");
        } else {
            window.overrideUserInterfaceStyle = .light;
            defaults.set(false, forKey: "darkMode");
        }
        defaults.synchronize();
        
    }
    
}
