//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Chitrala, Mani Kishore on 3/4/17.
//  Copyright © 2017 Chitrala, Mani Kishore. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSelectorControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard;
        let tip : Int8? = Int8(defaults.integer(forKey: "default_tip"));
        
        if let defaultTip = tip {
            if defaultTip == 15 {
                defaultTipSelectorControl.selectedSegmentIndex = 0;
            }
            else if defaultTip == 20 {
                defaultTipSelectorControl.selectedSegmentIndex = 1;
            }
            else if defaultTip == 25 {
                defaultTipSelectorControl.selectedSegmentIndex = 2;
            }
        }
        else {
            defaultTipSelectorControl.selectedSegmentIndex = 0;
            setDefaultTipInUserDefaults(defaultTip: 15);
        }
    }

    @IBAction func defaultTipSetter(_ sender: UISegmentedControl) {
        
        var defaultTip : Int8;
        
        switch sender.selectedSegmentIndex {
        case 0:
            defaultTip = 15;
        case 1:
            defaultTip = 20;
        case 2:
            defaultTip = 25;
        default:
            defaultTip = 15;
        }
        
        setDefaultTipInUserDefaults(defaultTip: defaultTip);
    }
    
    func setDefaultTipInUserDefaults(defaultTip tip : Int8) {
        let defaults = UserDefaults.standard;
        defaults.set(tip, forKey: "default_tip");
        defaults.synchronize();
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
