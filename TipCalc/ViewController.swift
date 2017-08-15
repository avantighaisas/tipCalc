//
//  ViewController.swift
//  TipCalc
//
//  Created by Avanti Ghaisas on 8/9/17.
//  Copyright © 2017 Avanti Ghaisas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tipFactor = [0.0, 0.18, 0.25, 0.3]
    @IBOutlet weak var tipToPay: UILabel!
    @IBOutlet weak var totalAmt: UILabel!
    @IBOutlet weak var totalBillAmt: UITextField!
    @IBOutlet weak var tipSeg: UISegmentedControl!
    @IBOutlet weak var feedbackMsg: UILabel!
    @IBOutlet weak var ambianceLabel: UIButton!
    @IBOutlet weak var serviceLabel: UIButton!
    @IBOutlet weak var foodLabel: UIButton!
    
   
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func billDidChange(_ sender: UITextField) {
        calTotalAmts()
        
    }
    
    @IBAction func tipDidChange(_ sender: UISegmentedControl) {
        calTotalAmts()
        
    }
    
    
    @IBAction func foodTapped(_ sender: UIButton) {
        
        updateUsersLikes(sender)
    }
    
    
    @IBAction func ServiceTapped(_ sender: UIButton) {
        updateUsersLikes(sender)
    }
    
    
    @IBAction func ambianceTapped(_ sender: UIButton) {
        updateUsersLikes(sender)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // Load key from user defaults
        let defaults = UserDefaults.standard
        let defaultTipStored = defaults.integer(forKey: "defaultTip")
        tipSeg.selectedSegmentIndex = defaultTipStored
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        totalBillAmt.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("view did load")
    }

    
    func calTotalAmts (){
        let billAmt = Double(totalBillAmt.text!) ?? 0
        let grandTip = billAmt * tipFactor[tipSeg.selectedSegmentIndex]
        let grandTotal = billAmt + grandTip
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        // Get local from device settings
        currencyFormatter.locale = NSLocale.current
        let formattedGrandTip = currencyFormatter.string(from: NSNumber(value: grandTip))
        let formattedGrandTotal = currencyFormatter.string(from: NSNumber(value: grandTotal))
        tipToPay.text = formattedGrandTip
        totalAmt.text = formattedGrandTotal
        // display feedback message
        if tipSeg.selectedSegmentIndex == 0{
            feedbackMsg.text = "\u{1F914} We need to improve on"
        }
        else{
            feedbackMsg.text = "\u{1F600} We did good job in"
        }
        
        // Clear the like button titles
        ambianceLabel.setTitle("", for: [])
        serviceLabel.setTitle("", for: [])
        foodLabel.setTitle("", for: [])
        
    }
    func updateUsersLikes(_ sender: UIButton){
        if tipSeg.selectedSegmentIndex == 0{
            sender.setTitle("\u{2705}", for: [])
        }
        else{
            sender.setTitle("\u{1F44D}", for: [])
        }
    }
}


