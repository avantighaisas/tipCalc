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
    
    @IBOutlet var homeScreenView: UIView!
    
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
        self.homeScreenView.alpha = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        totalBillAmt.becomeFirstResponder()
        UIView.animate(withDuration: 1.5, animations: {
            self.homeScreenView.alpha = 1
        })
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
        let genericBorderColor : UIColor = UIColor( red: 0.0, green: 0.47843137250000001, blue:1.0, alpha: 1.0 )
        let genericBorderWidth = CGFloat(1.0)
        totalBillAmt.layer.borderColor = genericBorderColor.cgColor
        totalBillAmt.layer.borderWidth = genericBorderWidth
        
        tipToPay.layer.borderColor = genericBorderColor.cgColor
        tipToPay.layer.borderWidth = genericBorderWidth
        
        totalAmt.layer.borderColor = genericBorderColor.cgColor
        totalAmt.layer.borderWidth = genericBorderWidth
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
            feedbackMsg.text = "\u{1F614} Sorry. Seems you had a bad experience. What went wrong today?"
        }
        else{
            feedbackMsg.text = "\u{263A} Thank you. How did we do today?"
        }
        
        // Clear the like button titles
        ambianceLabel.setTitle("", for: [])
        serviceLabel.setTitle("", for: [])
        foodLabel.setTitle("", for: [])
        
    }
    func updateUsersLikes(_ sender: UIButton){
        if tipSeg.selectedSegmentIndex == 0{
            sender.setTitle("\u{1F44E}", for: [])
        }
        else{
            sender.setTitle("\u{1F44D}", for: [])
        }
    }
}


