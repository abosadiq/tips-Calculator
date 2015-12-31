//
//  ViewController.swift
//  mytips
//
//  Created by Wafi MoHamed on 11/27/15.
//  Copyright © 2015 wafi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numOfPeople: UILabel!
    @IBOutlet weak var splitSwitch: UISwitch!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    var lowest_tip: Float = 0.0
    var low_tip: Float = 0.0
    var mid_tip: Float = 0.0
    var high_tip: Float = 0.0
    var highest_tip: Float = 0.0
    var tip : Float = 0.0
    var total : Float = 0.0
 
 
    
    
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var label_per_preson: UILabel!
    @IBOutlet weak var peopelLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    let currencyFormat = NSNumberFormatter()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        currencyFormat.locale = NSLocale.currentLocale()
        let currencySymbol = currencyFormat.currencySymbol
        
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "\(currencySymbol)0.00"
        totalLabel.text = "\(currencySymbol)0.00"
        peopelLabel.text = "\(currencySymbol)0.00"

        billField.placeholder = currencySymbol
    
//        personLabel.hidden = true
//        myStepper.hidden = true
//        label_per_preson.hidden = true
//        peopelLabel.hidden = true
//        numOfPeople.hidden = true
        testView.hidden = true
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func peopleStepper(sender: AnyObject) {
        currencyFormat.locale = NSLocale.currentLocale()
        let currencySymbol = currencyFormat.currencySymbol
        
        personLabel.text = String (Int (myStepper.value))
        let thePeopleTotal = total / Float(myStepper.value)
        
        peopelLabel.text = String(format:"\(currencySymbol) %.2f", thePeopleTotal)
      NSUserDefaults.standardUserDefaults().synchronize()

    }

    @IBAction func clearButton(sender: AnyObject) {
        let currencySymbol = currencyFormat.currencySymbol
        self.billField.text = nil
       self.totalLabel.text = "\(currencySymbol)0.00"
        self.tipLabel.text = "\(currencySymbol)0.00"
         self.peopelLabel.text = "\(currencySymbol)0.00"
        self.personLabel.text = "2"
        myStepper.value = 2

        
    }
    
    @IBAction func spliting_Switch(sender: AnyObject) {
        if splitSwitch.on{
//            personLabel.hidden = false
//            myStepper.hidden = false
//            label_per_preson.hidden = false
//            peopelLabel.hidden = false
//            numOfPeople.hidden = false
              testView.hidden = false
            view.endEditing(true)
        }
        else{
//            personLabel.hidden = true
//            myStepper.hidden = true
//            label_per_preson.hidden = true
//            peopelLabel.hidden = true
//            numOfPeople.hidden = true
            testView.hidden = true
            view.endEditing(false)
        }

        
    }
    
    @IBAction func  onEditingChanged(sender: AnyObject) {
        calculateAndUpdate()
        NSUserDefaults.standardUserDefaults().synchronize()

        
    }
    
    func calculateAndUpdate() {
        //var userDefaults = NSUserDefaults.standardUserDefaults()
        currencyFormat.locale = NSLocale.currentLocale()
        let currencySymbol = currencyFormat.currencySymbol
        
        var tipPercentages = [lowest_tip, low_tip, mid_tip, high_tip, highest_tip]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex ]
        
        let billAmount = NSString(string:billField.text!).floatValue
        tip = billAmount * tipPercentage
        
        total = billAmount + tip
                
         tipLabel.text = String(format:"\(currencySymbol) %.2f", tip)
        totalLabel.text = String(format:"\(currencySymbol) %.2f", total)
        
        let thePeopleTotal = total / Float(myStepper.value)
        
        peopelLabel.text = String(format:"\(currencySymbol) %.2f", thePeopleTotal)
       NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
         view.endEditing(true)
     }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let default_tip = defaults.integerForKey("selectedPosition")
        
         print(" default tip  : \(default_tip)")
        
        let save_tip_percentage = defaults.integerForKey("selectedPosition")
        
        tipControl.selectedSegmentIndex = (save_tip_percentage) - 1
        print("saved Tip : \(save_tip_percentage)")
        

        let userDefaults = NSUserDefaults.standardUserDefaults()
      
        
        let defaultTip = userDefaults.integerForKey("default_tip")
        switch defaultTip {
        case 0...4:
            tipControl.selectedSegmentIndex = defaultTip
        default:
            tipControl.selectedSegmentIndex = 0
             NSUserDefaults.standardUserDefaults().synchronize()        // end
        }
        
        
        
        
        
        
        
        
        lowest_tip = userDefaults.floatForKey("lowest")
        low_tip = userDefaults.floatForKey("low")
        mid_tip = userDefaults.floatForKey("mid")
        high_tip = userDefaults.floatForKey("high")
        highest_tip = userDefaults.floatForKey("highest")
        
                 //if index was saved from Settings page, retrieve the integer and programmatically select the sgc.
        let selectedPosition = userDefaults.integerForKey("selectedPosition")

        if selectedPosition >= 1 {
            print("selectedPosition: \(selectedPosition)")
            tipControl.selectedSegmentIndex = selectedPosition - 1
            calculateAndUpdate()
    
            
        }
        
        
        tipControl.setTitle("\(Int(lowest_tip * 100))%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(Int(low_tip * 100))%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(Int(mid_tip * 100))%", forSegmentAtIndex: 2)
        tipControl.setTitle("\(Int(high_tip * 100))%", forSegmentAtIndex: 3)
        tipControl.setTitle("\(Int(highest_tip * 100))%", forSegmentAtIndex: 4)
           NSUserDefaults.standardUserDefaults().synchronize()
    }
       
    
    }
