//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Chitrala, Mani Kishore on 3/4/17.
//  Copyright © 2017 Chitrala, Mani Kishore. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    var tipPercent : Double = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.becomeFirstResponder();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard;
        let tip : Int8? = Int8(defaults.integer(forKey: "default_tip"));
        
        if let defaultTip = tip {
            if defaultTip == 15 {
                tipPercentSegmentedControl.selectedSegmentIndex = 0;
                tipPercent = 15;
            }
            else if defaultTip == 20 {
                tipPercentSegmentedControl.selectedSegmentIndex = 1;
                tipPercent = 20;
            }
            else if defaultTip == 25 {
                tipPercentSegmentedControl.selectedSegmentIndex = 2;
                tipPercent = 25;
            }
        }
        else {
            tipPercentSegmentedControl.selectedSegmentIndex = 0;
            tipPercent = 15;
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string);
        
        if let bilAmountString = text, let billAmount = Double(bilAmountString) {
            let tip : Double = billAmount * tipPercent/100;
            tipAmountLabel.text = "$" + String(tip);
            totalAmountLabel.text = "$" + String(billAmount + tip);
        }
        else {
            tipAmountLabel.text = "$";
            totalAmountLabel.text = "$";
        }
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        tipAmountLabel.text = "$";
        totalAmountLabel.text = "$";
        return true;
    }
    
    @IBAction func tipPercentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tipPercent = 15;
        case 1:
            tipPercent = 20;
        case 2:
            tipPercent = 25;
        default:
            tipPercent = 15;
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
