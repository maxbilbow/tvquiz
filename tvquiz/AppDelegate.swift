//
//  AppDelegate.swift
//  tvquiz
//
//  Created by Max Bilbow on 17/10/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func printMessages(notification: AnyObject?) {
//        for notification in notifications {
            if let message = notification as? NSNotification {
                print(message.name)
            } else {
                NSLog("no message received: \(notification)")
            }
//        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "printMessages:", name: nil, object: nil)
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


    override func touchesEstimatedPropertiesUpdated(touches: Set<NSObject>)  {
        NSLog("touchesEstimatedPropertiesUpdated")
        
    }
    
//
//    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?){
//        NSLog("pressesBegan")
//    }
//    
//    override func pressesChanged(presses: Set<UIPress>, withEvent event: UIPressesEvent?){
//        NSLog("pressesChanged")
//        
//    }
//    
//    override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?){
//        NSLog("pressesEnded")
//    }
//    
//    override func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
//        NSLog("pressesCancelled")
//        
//    }
    
    

}

