//
//  ViewController.swift
//  tips
//
//  Created by Vivienne Zhang on 1/5/15.
//  Copyright (c) 2015 Vivienne Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileLabel: UIImageView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLable.text = "$0.00"
        profileLabel.image = UIImage(named: "Profile")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLable.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2F", tip)
        totalLable.text = String(format: "$%.2f", total)
        

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func animate(sender: AnyObject) {
        UIView.animateWithDuration(1.0) { () -> Void in
            var frame = self.profileLabel.frame
            frame.origin.x = CGFloat(Float(frame.origin.x) + 226.0)
            self.profileLabel.frame = frame;
        }
    }
}

