//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Avanti Ghaisas on 8/15/17.
//  Copyright © 2017 Avanti Ghaisas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet weak var tipPickerView: UIPickerView!
    
    @IBOutlet weak var defaultTipLabel: UITextField!
    
    @IBOutlet weak var settingsScreenView: UIView!
    
    var pickerTip: [String] = [String]()
    
    //MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pickerTip = ["No Tip", "18%", "25%", "30%"]
        self.tipPickerView.dataSource = self
        self.tipPickerView.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        UIView.animate(withDuration: 1.0, animations: {
            self.settingsScreenView.alpha = 1
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        self.settingsScreenView.alpha = 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTip.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTip[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaultTipLabel.text = pickerTip[row]
        let defaults = UserDefaults.standard // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
        defaults.set(row, forKey: "defaultTip")
        defaults.synchronize()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}
