//
//  AppDelegate.swift
//  mytips
//
//  Created by Wafi MoHamed on 11/27/15.
//  Copyright © 2015 wafi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
       let userDefaults = NSUserDefaults.standardUserDefaults()
        let isFristLoad = userDefaults.boolForKey("is_frist_load")

        if(!isFristLoad){
            userDefaults.setFloat(0.10, forKey: "lowest")
            userDefaults.setFloat(0.15, forKey: "low")
            userDefaults.setFloat(0.20, forKey: "mid")
            userDefaults.setFloat(0.25, forKey: "high")
            userDefaults.setFloat(0.30, forKey: "highest")
            userDefaults.setFloat(1.00, forKey: "num_people")
            userDefaults.setBool(true, forKey: "is_frist_load")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
            return true
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

