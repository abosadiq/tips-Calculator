//
//  SettingsViewController.swift
//  mytips
//
//  Created by Wafi MoHamed on 12/12/15.
//  Copyright © 2015 wafi. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {



  @IBOutlet weak var maxValue: UILabel!
    @IBOutlet weak var minValue: UILabel!
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    var lowest_tip: Float = 0.0
    var low_tip: Float = 0.0
    var mid_tip: Float = 0.0
    var high_tip: Float = 0.0
    var highest_tip: Float = 0.0
    let total: Float = 0.0
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValue.text = "0%"
        let userDefaults = NSUserDefaults.standardUserDefaults()
        lowest_tip = userDefaults.floatForKey("lowest")
        low_tip = userDefaults.floatForKey("low")
        mid_tip = userDefaults.floatForKey("mid")
        high_tip = userDefaults.floatForKey("high")
        highest_tip = userDefaults.floatForKey("highest")
        

        SegmentControl.setTitle("\(Int(lowest_tip * 100))%", forSegmentAtIndex: 0)
      
        SegmentControl.setTitle("\(Int(low_tip * 100))%", forSegmentAtIndex: 1)
        SegmentControl.setTitle("\(Int(mid_tip * 100))%", forSegmentAtIndex: 2)
        SegmentControl.setTitle("\(Int(high_tip * 100))%", forSegmentAtIndex: 3)
        SegmentControl.setTitle("\(Int(highest_tip * 100))%", forSegmentAtIndex: 4)
        
        
        slider.value = defaults.floatForKey("lastsliderAmount")
        sliderValue.text = defaults.stringForKey("lastsliderVal")
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
          print("view did appear")
           
        
        let default_tip = defaults.integerForKey("selectedPosition")

        print(" default tip  : \(default_tip)")
       
        let save_tip_percentage = defaults.integerForKey("selectedPosition")
        
        SegmentControl.selectedSegmentIndex = (save_tip_percentage) - 1
        print("saved Tip : \(save_tip_percentage)")
      
    
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        let sliderAmount = slider.value
        let sliderVal = sliderValue.text
        
        NSUserDefaults.standardUserDefaults().setObject(sliderAmount, forKey: "lastsliderAmount")
        NSUserDefaults.standardUserDefaults().setObject(sliderVal, forKey: "lastsliderVal")
        
    }
    
    
           override func didReceiveMemoryWarning() {
        
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
    }
    
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        print("view did appear")
//    }
//    override func viewDidDisappear(animated: Bool) {
//        super.viewDidAppear(animated)
//        print("view did disappear")
//    }
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("view will disappear")
//        
//    }
    @IBAction func onSegmentedControlChanged(sender: AnyObject) {
        
        
        let userDefaults = NSUserDefaults.standardUserDefaults ()

         

        if sender.selectedSegmentIndex == 0  {
            userDefaults.setInteger(1, forKey: "selectedPosition")
            print("first item selected")
            
        } else if sender.selectedSegmentIndex == 1 {
            userDefaults.setInteger(2, forKey: "selectedPosition")
        }
            else if sender.selectedSegmentIndex == 2 {
            userDefaults.setInteger(3, forKey: "selectedPosition")
        }
            else if sender.selectedSegmentIndex == 3 {
            userDefaults.setInteger(4, forKey: "selectedPosition")
        }
            else if sender.selectedSegmentIndex == 4{
            userDefaults.setInteger(5, forKey: "selectedPosition")
        }
       
        
        
        NSUserDefaults.standardUserDefaults().synchronize()

    }
    
     
    
    
    @IBAction func sliderValueChange(sender: UISlider) {
    let myslider: String = String (Int (sender.value))
        sliderValue.text = " \(myslider) %"
        let new_title = "\(Int(slider.value))%"
       SegmentControl.setTitle(new_title, forSegmentAtIndex: SegmentControl.selectedSegmentIndex)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let new_floatValue : Float = roundf(slider.value) / 100
        
        
        if (SegmentControl.selectedSegmentIndex == 0){
            userDefaults.setFloat(new_floatValue, forKey: "lowest")
        }
        else if ( SegmentControl.selectedSegmentIndex == 1){
            userDefaults.setFloat(new_floatValue, forKey: "low")

        }
        else if ( SegmentControl.selectedSegmentIndex == 2){
            userDefaults.setFloat(new_floatValue, forKey: "mid")
            
        }
        else if ( SegmentControl.selectedSegmentIndex == 3){
            userDefaults.setFloat(new_floatValue, forKey: "high")
            
        }
        else if ( SegmentControl.selectedSegmentIndex == 4){
            userDefaults.setFloat(new_floatValue, forKey: "highest")
            
        }
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    
    
    

    @IBAction func onTouchDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
         
    }
    

 }